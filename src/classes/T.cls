/**
 * MIT License
 *
 * Copyright (c) 2018 Click to Cloud Pty Ltd
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 **/
/**
 * Entry point for test class utilities
 * */
@isTest
public class T implements System.StubProvider {
    // Record last missed method invocation
    private static MethodInvocation lastMissedMethodInvocation = null;

    // Record last method invocation
    private static MethodInvocation lastMethodInvocation = null;

    // Record last stub provider
    private static T lastStubProvider = null;

    // Keep track of all stubs
    private static Map<Object, T> stubs = new Map<Object, T>();

    // Record all predicates
    private static List<Func> predicates = new List<Func>();

    // Keep track of the method invocations of this stub
    private List<MethodInvocation> invocations = new List<MethodInvocation>();

    // Implement dynamic stub
    public Object handleMethodCall(Object stub,
            String name,
            Type returnType,
            List<Type> paramTypes,
            List<String> paramNames,
            List<Object> paramValues) {
        T.lastStubProvider = this;
        T.stubs.put(stub, this);

        T.recordLastMethodInvocation(name, returnType, paramTypes, paramNames, paramValues);

        MethodInvocation inv = this.findMethodInvocation(name, paramTypes, paramValues);

        if(inv != null) {
            // If the method invocation is found, invoke it
            return this.invokeMethod(inv, paramValues);
        }
        else {
            // If the method invocation is not found, take it as being recording, expecting methods 'thenXxx'
            T.recordLastMissedMethodInvocation();

            return this.getDefaultReturnValue(returnType);
        }
    }

    private Object invokeMethod(MethodInvocation inv, List<Object> paramValues) {
        return inv.invoke(paramValues);
    }

    private Boolean canInvokeMethod(MethodInvocation inv, String name, List<Type> paramTypes, List<Object> paramValues) {
        return inv.canInvoke(name, paramTypes, paramValues);
    }

    private MethodInvocation findMethodInvocation(String name, List<Type> paramTypes, List<Object> paramValues) {
        for(MethodInvocation inv : this.invocations) {
            if(this.canInvokeMethod(inv, name, paramTypes, paramValues)) {
                return inv;
            }
        }

        return null;
    }

    private Object getDefaultReturnValue(Type returnType) {
        if(returnType == Boolean.class) {
            return false;
        }
        else if(returnType == Integer.class) {
            return (Integer)0;
        }
        else if(returnType == Long.class) {
            return (Long)0;
        }
        else if(returnType == Double.class) {
            return (Double)0;
        }
        else if(returnType == Decimal.class) {
            return (Decimal)0;
        }
        else {
            return null;
        }
    }

    /**
     * Return an Expect object for expecting style assertion
     *
     * Example:
     * T.expect(true).toBe(true);
     * // expect true to be true
     *
     * @param value The value to be asserted on
     * @return Expect
     * */
    public static Expect expect(Object value) {
        return new Expect(value);
    }

    /**
     * Return a Verify object to verify the behavior of the mock object method invocations
     *
     * Example:
     * T.verify(mock, 'getName', new List<Type>()).toHaveBeenCalled();
     * // verify mock.getName() has been called
     *
     * @param stub The mock object
     * @param methodName The method name to be verified
     * @param paramTypes The param types to identify the method
     * @return Verify
     * */
    public static Verify verify(Object stub, String methodName, List<Type> paramTypes) {
        T instance = T.stubs.get(stub);
        if(instance == null) {
            throw new TestException('Failed to find such stub provider instance');
        }

        return new Verify(instance.invocations, methodName, paramTypes);
    }

    /**
     * Return a Verify object to verify the behavior of the mock object method invocations
     *
     * Example:
     * T.verify(mock, 'getName').toHaveBeenCalled();
     * // verify mock.getName(...) has been called
     *
     * @param stub The mock object
     * @param methodName The method name to be verified
     * @return Verify
     * */
    public static Verify verify(Object stub, String methodName) {
        return verify(stub, methodName, null);
    }

    /**
     * Fail the test directly
     *
     * Example:
     * T.fail('Should fail here');
     * // fail the assertion here
     *
     * @param message The failure message
     * */
    public static void fail(String message) {
        System.assert(false, message);
    }

    /**
     * Create a mock object from the type
     *
     * Example:
     * Func mock = T.mock(Func.class);
     * // Create a mock object of Func
     *
     * @param typeToMock The type to create a mock
     * @return Object
     * */
    public static Object mock(Type typeToMock) {
        return Test.createStub(typeToMock, new T());
    }

    /**
     * Set up the scenario to establish the mock behavior
     *
     * Example:
     * T.when(mock.run(0)).thenReturn(0);
     * // When the mock calls 'run' with 0, return 0
     *
     * @param value The value of the just called method
     * @return MethodInvocation
     * */
    public static MethodInvocation when(Object value) {
        if(T.lastMissedMethodInvocation == null) {
            if(T.lastMethodInvocation == null) {
                throw new TestException('No mock method has been invoked yet');
            }
            else {
                throw new TestException('Behavior has already been established for method ' + T.lastMethodInvocation.name);
            }
        }
        else {
            MethodInvocation inv = T.lastMissedMethodInvocation;
            T.lastMissedMethodInvocation = null;

            if(!T.predicates.isEmpty()) {
                if(T.predicates.size() != inv.paramTypes.size()) {
                    throw new TestException('Parameter values should be all predicates or none');
                }

                inv.predicates = T.predicates;
                T.predicates = new List<Func>();
            }

            T.lastStubProvider.invocations.add(inv);

            return inv;
        }

        return null;
    }

    /**
     * The argument matcher to match any argument of type Object
     *
     * Example:
     * T.when(mock.run(T.any())).thenReturn(0);
     * // When the mock calls 'run' with Object of any, return 0
     *
     * @return Object
     * */
    public static Object any() {
        return any(R.T);
    }

    /**
     * The argument matcher to match the given argument of type Object
     *
     * Example:
     * T.when(mock.run(T.any(0))).thenReturn(0);
     * // When mock calls 'run' with Object of 0, return 0
     *
     * @param value The matching value
     * @return Object
     * */
    public static Object any(Object value) {
        return any(R.equals.apply(value));
    }

    /**
     * The argument matcher to match any Object that passes the predicate
     *
     * Example:
     * T.when(mock.run(T.any(R.isNotNull))).thenReturn(0);
     * // When mock calls 'run' with Object that is not null, return 0
     *
     * @param pred The predicate
     * @return Object
     * */
    public static Object any(Func pred) {
        validatePredicate(pred);

        T.predicates.add(pred);

        return null;
    }

    /**
     * The argument matcher to match any Boolean
     *
     * Example:
     * T.when(mock.run(T.anyBoolean())).thenReturn(0);
     * // When mock calls 'run' with any Boolean, return 0
     *
     * @return Boolean
     * */
    public static Boolean anyBoolean() {
        return anyBoolean(R.T);
    }

    /**
     * The argument matcher to match any Boolean that equals to the value
     *
     * Example:
     * T.when(mock.run(T.anyBoolean(true))).thenReturn(0);
     * // When mock calls 'run' with Boolean true, return 0
     *
     * @param value The matching value
     * @return Boolean
     * */
    public static Boolean anyBoolean(Boolean value) {
        return anyBoolean(R.equals.apply(value));
    }

    /**
     * The argument matcher to match any Boolean that passes the predicate
     *
     * Example:
     * T.when(mock.run(T.anyBoolean(R.isNotNull))).thenReturn(0);
     * // When mock calls 'run' with any Boolean that is not null, return 0
     *
     * @param pred The predicate
     * @return Boolean
     * */
    public static Boolean anyBoolean(Func pred) {
        validatePredicate(pred);

        T.predicates.add(safeBoolean.apply(pred));

        return false;
    }

    /**
     * Argument matcher to match any Integer
     *
     * Example:
     * T.when(mock.run(T.anyInteger())).thenReturn(0);
     * // When mock calls 'run' with any Integer, return 0
     *
     * @return Integer
     * */
    public static Integer anyInteger() {
        return anyInteger(R.T);
    }

    /**
     * Argument matcher to match any Integer that equals to the value
     *
     * Example:
     * T.when(mock.run(T.anyInteger(2))).thenReturn(0);
     * // When mock calls 'run' with any Integer 2, return 0
     *
     * @param value The matching value
     * @return Integer
     * */
    public static Integer anyInteger(Integer value) {
        return anyInteger(R.equals.apply(value));
    }

    /**
     * Argument matcher to match any Integer that passes the predicate
     *
     * Example:
     * T.when(mock.run(T.anyInteger(R.gt.apply(R.placeholder, 2)))).thenReturn(0);
     * // When mock calls 'run' with any Integer that is greater than 2, return 0
     *
     * @param pred The predicate
     * @return Integer
     * */
    public static Integer anyInteger(Func pred) {
        validatePredicate(pred);

        T.predicates.add(safeInteger.apply(pred));

        return 0;
    }

    /**
     * Argument matcher to match any Long
     *
     * Example:
     * T.when(mock.run(T.anyLong())).thenReturn(0);
     * // When mock calls 'run' with any Long, return 0
     *
     * @return Long
     * */
    public static Long anyLong() {
        return anyLong(R.T);
    }

    /**
     * Argument matcher to match any Long that equals to the value
     *
     * Example:
     * T.when(mock.run(T.anyLong(2))).thenReturn(0);
     * // When mock calls 'run' with any Long 2, return 0
     *
     * @param value The matching value
     * @return Long
     * */
    public static Long anyLong(Long value) {
        return anyLong(R.equals.apply(value));
    }

    /**
     * Argument matcher to match any Long that passed the predicate
     *
     * Example:
     * T.when(mock.run(T.anyLong(T.equals.apply(2)))).thenReturn(0);
     * // When mock calls 'run' with any Long that equals 2, return 0
     *
     * @param pred The predicate
     * @return Long
     * */
    public static Long anyLong(Func pred) {
        validatePredicate(pred);

        T.predicates.add(safeLong.apply(pred));

        return 0;
    }

    /**
     * Argument matcher to match any Double
     *
     * Example:
     * T.when(mock.run(T.anyDouble())).thenReturn(0);
     * // When mock calls 'run' with any Double, return 0
     *
     * @return Double
     * */
    public static Double anyDouble() {
        return anyDouble(R.T);
    }

    /**
     * Argument matcher to match any Double that equals to the value
     *
     * Example:
     * T.when(mock.run(T.anyDouble(2))).thenReturn(0);
     * // When mock calls 'run' with any Double 2, return 0
     *
     * @param value The matching value
     * @return Double
     * */
    public static Double anyDouble(Double value) {
        return anyDouble(R.equals.apply(value));
    }

    /**
     * Argument matcher to match any Double that passes the predicate
     *
     * Example:
     * T.when(mock.run(T.anyDouble(T.equals.apply(2)))).thenReturn(0);
     * // When mock calls 'run' with any Double that equals to 2, return 0
     *
     * @param pred The predicate
     * @return Double
     * */
    public static Double anyDouble(Func pred) {
        validatePredicate(pred);

        T.predicates.add(safeDouble.apply(pred));

        return 0;
    }

    /**
     * Argument matcher to match any Decimal
     *
     * Example:
     * T.when(mock.run(T.anyDecimal())).thenReturn(0);
     * // When mock calls 'run' with any Decimal, return 0
     *
     * @return Decimal
     * */
    public static Decimal anyDecimal() {
        return anyDecimal(R.T);
    }

    /**
     * Argument matcher to match any Decimal that equals to value
     *
     * Example:
     * T.when(mock.run(T.anyDecimal(2))).thenReturn(0);
     * // When mock calls 'run' with any Decimal 2, return 0
     *
     * @param value The matching value
     * @return Decimal
     * */
    public static Decimal anyDecimal(Decimal value) {
        return anyDecimal(R.equals.apply(value));
    }

    /**
     * Argument matcher to match any Decimal that passes the predicate
     *
     * Example:
     * T.when(mock.run(T.anyDecimal(R.equals.apply(2)))).thenReturn(0);
     * // When mock calls 'run' with any Decimal that equals to 2, return 0
     *
     * @param pred The predicate
     * @return Decimal
     * */
    public static Decimal anyDecimal(Func pred) {
        validatePredicate(pred);

        T.predicates.add(safeDecimal.apply(pred));

        return 0;
    }

    /**
     * Argument matcher to match any String
     *
     * Example:
     * T.when(mock.run(T.anyString())).thenReturn(0);
     * // When mock calls 'run' with any String, return 0
     *
     * @return String
     * */
    public static String anyString() {
        return anyString(R.T);
    }

    /**
     * Argument matcher to match any String that equals to value
     *
     * Example:
     * T.when(mock.run(T.anyString('abc'))).thenReturn(0);
     * // When mock calls 'run' with any String 'abc', return 0
     *
     * @param value The matching value
     * @return String
     * */
    public static String anyString(String value) {
        return anyString(R.equals.apply(value));
    }

    /**
     * Argument matcher to match any String that passes the predicate
     *
     * Example:
     * T.when(mock.run(T.anyString(R.equals.apply('abc')))).thenReturn(0);
     * // When mock calls 'run' with any String that equals to 'abc', return 0
     *
     * @param pred The predicate
     * @return String
     * */
    public static String anyString(Func pred) {
        validatePredicate(pred);

        T.predicates.add(safeString.apply(pred));

        return '';
    }

    /**
     * Argument matcher to match any List
     *
     * Example:
     * T.when(mock.run(T.anyList())).thenReturn(0);
     * // When mock calls 'run' with any List<Object>, return 0
     *
     * @return List<Object>
     * */
    public static List<Object> anyList() {
        return anyList(R.T);
    }

    /**
     * Argument matcher to match any List that equals to value
     *
     * Example:
     * T.when(mock.run(T.anyList(new List<Object>{ 1, 2 }))).thenReturn(0);
     * // When mock calls 'run' with a list that equals to the given list, return 0
     *
     * @param value The matching value
     * @return List<Object>
     * */
    public static List<Object> anyList(List<Object> value) {
        return anyList(R.equals.apply(value));
    }

    /**
     * Argument matcher to match any List that passes the predicate
     *
     * Example:
     * T.when(mock.run(T.anyList(T.isEmpty))).thenReturn(0);
     * // When mock calls 'run' with an empty list, return 0
     *
     * @param pred The predicate
     * @return List<Object>
     * */
    public static List<Object> anyList(Func pred) {
        validatePredicate(pred);

        T.predicates.add(safeList.apply(pred));

        return new List<Object>();
    }

    /**
     * Argument matcher to match any Set
     *
     * Example:
     * T.when(mock.run(T.anySet())).thenReturn(0);
     * // When mock calls 'run' with any Set<String>, return 0
     *
     * @return Set<String>
     * */
    public static Set<String> anySet() {
        return anySet(R.T);
    }

    /**
     * Argument matcher to match any Set that equals to value
     *
     * Example:
     * T.when(mock.run(T.anySet(new Set<String>()))).thenReturn(0);
     * // When mock calls 'run' with an empty Set<String>, return 0
     *
     * @param value The matching value
     * @return Set<String>
     * */
    public static Set<String> anySet(Set<String> value) {
        return anySet(R.equals.apply(value));
    }

    /**
     * Argument matcher to match any Set that passes the predicate
     *
     * Example:
     * T.when(mock.run(T.anySet(R.isEmpty))).thenReturn(0);
     * // When mock calls 'run' with an empty Set<String>, return 0
     *
     * @param pred The predicate
     * @return Set<String>
     * */
    public static Set<String> anySet(Func pred) {
        validatePredicate(pred);

        T.predicates.add(safeSet.apply(pred));

        return new Set<String>();
    }

    /**
     * Argument matcher to match any Map
     *
     * Example:
     * T.when(mock.run(T.anyMap())).thenReturn(0);
     * // When mock calls 'run' with any Map<String, Object>, return 0
     *
     * @return Map<String, Object>
     * */
    public static Map<String, Object> anyMap() {
        return anyMap(R.T);
    }

    /**
     * Argument matcher to match any map that equals to value
     *
     * Example:
     * T.when(mock.run(T.anyMap(new Map<String, Object>()))).thenReturn(0);
     * // When mock calls 'run' with an empty Map<String, Object>, return 0
     *
     * @param value The matching value
     * @return Map<String, Object>
     * */
    public static Map<String, Object> anyMap(Map<String, Object> value) {
        return anyMap(R.equals.apply(value));
    }

    /**
     * Argument matcher to match any Map that passes the predicate
     *
     * Example:
     * T.when(mock.run(T.anyMap(R.isEmpty))).thenReturn(0);
     * // When mock calls 'run' with an empty Map<String, Object>, return 0
     *
     * @param pred The predicate
     * @return Map<String, Object>
     * */
    public static Map<String, Object> anyMap(Func pred) {
        validatePredicate(pred);

        T.predicates.add(safeMap.apply(pred));

        return new Map<String, Object>();
    }

    /**
     * Argument matcher to match any SObject
     *
     * Example:
     * T.when(mock.run(T.anySObject())).thenReturn(0);
     * // Wehn mock calls 'run' with any SObject, return 0
     *
     * @return SObject
     * */
    public static SObject anySObject() {
        return anySObject(R.T);
    }

    /**
     * Argument matcher to match any SObject that equals to value
     *
     * Example:
     * T.when(mock.run(T.anySObject(new Account()))).thenReturn(0);
     * // When mock calls 'run' with an empty Account, return 0
     *
     * @param value The matching value
     * @return SObject
     * */
    public static SObject anySObject(SObject value) {
        return anySObject(R.equals.apply(value));
    }

    /**
     * Argument matcher to match any SObject that passes the predicate
     *
     * Example:
     * T.when(mock.run(T.anySObject(R.equals.apply(new Account())))).thenReturn(0);
     * // When mock calls 'run' with an empty Account, return 0
     *
     * @param pred The predicate
     * @return SObject
     * */
    public static SObject anySObject(Func pred) {
        validatePredicate(pred);

        T.predicates.add(safeSObject.apply(pred));

        return null;
    }

    /**
     * Argument matcher to match any Date
     *
     * Example:
     * T.when(mock.run(T.anyDate())).thenReturn(0);
     * // When mock calls 'run' with any Date, return 0
     *
     * @return Date
     * */
    public static Date anyDate() {
        return anyDate(R.T);
    }

    /**
     * Argument matcher to match any Date that equals to value
     *
     * Example:
     * T.when(mock.run(T.anyDate(Date.newInstance(2018, 1, 1)))).thenReturn(0);
     * // When mock calls 'run' with any Date 2018/1/1, return 0
     *
     * @param value The matching value
     * @return Date
     * */
    public static Date anyDate(Date value) {
        return anyDate(R.equals.apply(value));
    }

    /**
     * Argument matcher to match any Date that passes the predicate
     *
     * Example:
     * T.when(mock.run(T.anyDate(R.equals.apply(Date.newInstance(2018, 1, 1))))).thenReturn(0);
     * // When mock calls 'run' with any Date that equals to 2018/1/1, return 0
     *
     * @param pred The predicate
     * @return Date
     * */
    public static Date anyDate(Func pred) {
        validatePredicate(pred);

        T.predicates.add(safeDate.apply(pred));

        return null;
    }

    /**
     * Argument matcher to match any Time
     *
     * Example:
     * T.when(mock.run(T.anyTime())).thenReturn(0);
     * // When mock calls 'run' with any Time, return 0
     *
     * @return Time
     * */
    public static Time anyTime() {
        return anyTime(R.T);
    }

    /**
     * Argument matcher to match any Time that equals to value
     *
     * Example:
     * T.when(mock.run(T.anyTime(Time.newInstance(8, 0, 0, 0)))).thenReturn(0);
     * // When mock calls 'run' with any Time that equals to 8:00, return 0
     *
     * @param value The matching value
     * @return Time
     * */
    public static Time anyTime(Time value) {
        return anyTime(R.equals.apply(value));
    }

    /**
     * Argument matcher to match any Time that passes a predicate
     *
     * Example:
     * T.when(mock.run(T.anyTime(R.equals.apply(Time.newInstance(8, 0, 0, 0))))).thenReturn(0);
     * // When mock calls 'run' with any Time that equals to 8:00, return 0
     *
     * @param pred The predicate
     * @return Time
     * */
    public static Time anyTime(Func pred) {
        validatePredicate(pred);

        T.predicates.add(safeTime.apply(pred));

        return null;
    }

    /**
     * Argument matcher to match any Datetime
     *
     * Example:
     * T.when(mock.run(T.anyDatetime())).thenReturn(0);
     * // When mock calls 'run' with any Datetime, return 0
     *
     * @return Datetime
     * */
    public static Datetime anyDatetime() {
        return anyDatetime(R.T);
    }

    /**
     * Argument matcher to match any Datetime that equals to the value
     *
     * Example:
     * T.when(mock.run(T.anyDatetime(Datetime.newInstance(2018, 1, 1, 8, 0, 0)))).thenReturn(0);
     * // When mock calls 'run' with any Datetime that equals to 2018/1/1 8:00, return 0
     *
     * @param value The matching value
     * @return Datetime
     * */
    public static Datetime anyDatetime(Datetime value) {
        return anyDatetime(R.equals.apply(value));
    }

    /**
     * Argument matcher to match any Datetime that passes the predicate
     *
     * Example:
     * T.when(mock.run(T.anyDatetime(R.isNotNull))).thenReturn(0);
     * // When mock calls 'run' with any Datetime that is not null, return 0
     *
     * @param pred The predicate
     * @return Datetime
     * */
    public static Datetime anyDatetime(Func pred) {
        validatePredicate(pred);

        T.predicates.add(safeDatetime.apply(pred));

        return null;
    }

    /**
     * Asymmetric matcher to match any Object of the type
     *
     * Example:
     * T.expect(result).toEqual(T.objectOfAny(String.class));
     * // Expect result to be of type String
     *
     * @param t The type
     * @return IMatcher
     * */
    public static IMatcher objectOfAny(Type t) {
        return new AnyMatcher(t);
    }

    /**
     * Asymmetric matcher to match anything but null
     *
     * Example:
     * T.expect(result).toEqual(T.objectOfAnything());
     * // Expect result to not be null
     *
     * @return IMatcher
     * */
    public static IMatcher objectOfAnything() {
        return new AnythingMatcher();
    }

    /**
     * Asymmetric matcher to check a map contains the given map
     *
     * Example:
     * T.expect(result).toEqual(T.mapContaining(new Map<String, Object>{ 'name' => 'test' }));
     * // Expect result to contain all key-value pairs from the given map
     *
     * @param data The partial map
     * @return IMatcher
     * */
    public static IMatcher mapContaining(Map<String, Object> data) {
        return new MapContainingMatcher(data);
    }

    /**
     * Asymmetric matcher to check a list contains the given list
     *
     * Example:
     * T.expect(result).toEqual(T.listContaining(new List<Object>{ 1 }));
     * // Expect result to contain all elements from the given list
     *
     * @param mList The partial list
     * @return IMatcher
     * */
    public static IMatcher listContaining(List<Object> mList) {
        return new ListContainingMatcher(mList);
    }

    /**
     * Create random data of the type with the options
     *
     * Example:
     * String s = T.create('String', new Map<String, Object>{ 'min' => 5 });
     * // Create a random string that is not shorter than 5
     *
     * @param typeName The name of the type
     * @param options The options to create random data
     * @return Object
     * */
    public static Object create(String typeName, Map<String, Object> options) {
        return Random.anyObject.run(new Map<String, Object>{
            'type' => typeName,
            'config' => options
        });
    }

    /**
     * Create random data of the type with default options
     *
     * Example:
     * String s = T.create('String');
     * // Create a random string
     *
     * @param typeName The type name
     * @return Object
     * */
    public static Object create(String typeName) {
        return create(typeName, null);
    }

    /**
     * Create a random SObject with the type name and options
     *
     * Example:
     * Account acc = (Account)T.createSObject('Account', new Map<String, Object>{
     *     'cascade' => true,
     *     'fields' => new List<String>{ 'Description' }
     * });
     * // Create a random account that fills any reference field with random object, and
     * // also fills the 'Description' fields
     *
     * @param typeName the type name
     * @param options The options
     * @return Object
     * */
    public static Object createSObject(String typeName, Map<String, Object> options) {
        Map<String, Object> config = new Map<String, Object>();
        config.putAll(options);
        config.put('type', typeName);
        return Random.anySObject.run(config);
    }

    /**
     * Create a random SObject with the type name and default options
     *
     * Example:
     * Account acc = (Account)T.createSObject('Account');
     * // Create a random account
     *
     * @param typeName The type name
     * @return Object
     * */
    public static Object createSObject(String typeName) {
        return createSObject(typeName, null);
    }

    private static void validatePredicate(Func pred) {
        if(pred == null) {
            throw new TestException('Parameter value predicate should not be null');
        }
    }

    private static void recordLastMethodInvocation(String name,
            Type returnType,
            List<Type> paramTypes,
            List<String> paramNames,
            List<Object> paramValues) {
        T.lastMethodInvocation = new MethodInvocation();
        T.lastMethodInvocation.name = name;
        T.lastMethodInvocation.paramTypes = paramTypes;
        T.lastMethodInvocation.paramNames = paramNames;
        T.lastMethodInvocation.paramValues = paramValues;
        T.lastMethodInvocation.returnType = returnType;
    }

    private static void recordLastMissedMethodInvocation() {
        T.lastMissedMethodInvocation = T.lastMethodInvocation;
    }

    private static String message(String template, Object expected, Object actual) {
        String m = template;
        m = m.replaceAll('\\{expected\\}', expected != null ? Matcher.quoteReplacement(String.valueOf(expected)) : 'null');
        m = m.replaceAll('\\{actual\\}', actual != null ? Matcher.quoteReplacement(String.valueOf(actual)) : 'null');

        return m;
    }

    private static final Func safeBoolean = new SafeBooleanFunc();
    private static final Func safeInteger = new SafeIntegerFunc();
    private static final Func safeLong = new SafeLongFunc();
    private static final Func safeDouble = new SafeDoubleFunc();
    private static final Func safeDecimal = new SafeDecimalFunc();
    private static final Func safeString = new SafeStringFunc();
    private static final Func safeList = new SafeListFunc();
    private static final Func safeSet = new SafeSetFunc();
    private static final Func safeMap = new SafeMapFunc();
    private static final Func safeSObject = new SafeSObjectFunc();
    private static final Func safeDate = new SafeDateFunc();
    private static final Func safeTime = new SafeTimeFunc();
    private static final Func safeDatetime = new SafeDatetimeFunc();

    private static final String INVOKE_BY_RETURNING = 'return';
    private static final String INVOKE_BY_THROWING = 'throw';
    private static final String INVOKE_BY_ANSWERING = 'answer';

    private class SafeBooleanFunc extends Func {
        public SafeBooleanFunc() {
            super(2);
        }

        public override Object exec(Object arg1, Object arg2) {
            Func pred = (Func)arg1;
            if(arg2 instanceof Boolean) {
                return pred.run(arg2);
            }
            else {
                return false;
            }
        }
    }

    private class SafeIntegerFunc extends Func {
        public SafeIntegerFunc() {
            super(2);
        }

        public override Object exec(Object arg1, Object arg2) {
            Func pred = (Func)arg1;
            if(arg2 instanceof Integer) {
                return pred.run(arg2);
            }
            else {
                return false;
            }
        }
    }

    private class SafeLongFunc extends Func {
        public SafeLongFunc() {
            super(2);
        }

        public override Object exec(Object arg1, Object arg2) {
            Func pred = (Func)arg1;
            if(arg2 instanceof Long) {
                return pred.run(arg2);
            }
            else {
                return false;
            }
        }
    }

    private class SafeDoubleFunc extends Func {
        public SafeDoubleFunc() {
            super(2);
        }

        public override Object exec(Object arg1, Object arg2) {
            Func pred = (Func)arg1;
            if(arg2 instanceof Double) {
                return pred.run(arg2);
            }
            else {
                return false;
            }
        }
    }

    private class SafeDecimalFunc extends Func {
        public SafeDecimalFunc() {
            super(2);
        }

        public override Object exec(Object arg1, Object arg2) {
            Func pred = (Func)arg1;
            if(arg2 instanceof Decimal) {
                return pred.run(arg2);
            }
            else {
                return false;
            }
        }
    }

    private class SafeStringFunc extends Func {
        public SafeStringFunc() {
            super(2);
        }

        public override Object exec(Object arg1, Object arg2) {
            Func pred = (Func)arg1;
            if(arg2 instanceof String) {
                return pred.run(arg2);
            }
            else {
                return false;
            }
        }
    }

    private class SafeListFunc extends Func {
        public SafeListFunc() {
            super(2);
        }

        public override Object exec(Object arg1, Object arg2) {
            Func pred = (Func)arg1;
            if(arg2 instanceof List<Object>) {
                return pred.run(arg2);
            }
            else {
                return false;
            }
        }
    }

    private class SafeSetFunc extends Func {
        public SafeSetFunc() {
            super(2);
        }

        public override Object exec(Object arg1, Object arg2) {
            Func pred = (Func)arg1;
            if(arg2 instanceof Set<String>) {
                return pred.run(arg2);
            }
            else {
                return false;
            }
        }
    }

    private class SafeMapFunc extends Func {
        public SafeMapFunc() {
            super(2);
        }

        public override Object exec(Object arg1, Object arg2) {
            Func pred = (Func)arg1;
            if(arg2 instanceof Map<String, Object>) {
                return pred.run(arg2);
            }
            else {
                return false;
            }
        }
    }

    private class SafeSObjectFunc extends Func {
        public SafeSObjectFunc() {
            super(2);
        }

        public override Object exec(Object arg1, Object arg2) {
            Func pred = (Func)arg1;
            if(arg2 instanceof SObject) {
                return pred.run(arg2);
            }
            else {
                return false;
            }
        }
    }

    private class SafeDateFunc extends Func {
        public SafeDateFunc() {
            super(2);
        }

        public override Object exec(Object arg1, Object arg2) {
            Func pred = (Func)arg1;
            if(arg2 instanceof Date) {
                return pred.run(arg2);
            }
            else {
                return false;
            }
        }
    }

    private class SafeTimeFunc extends Func {
        public SafeTimeFunc() {
            super(2);
        }

        public override Object exec(Object arg1, Object arg2) {
            Func pred = (Func)arg1;
            if(arg2 instanceof Time) {
                return pred.run(arg2);
            }
            else {
                return false;
            }
        }
    }

    private class SafeDatetimeFunc extends Func {
        public SafeDatetimeFunc() {
            super(2);
        }

        public override Object exec(Object arg1, Object arg2) {
            Func pred = (Func)arg1;
            if(arg2 instanceof Datetime) {
                return pred.run(arg2);
            }
            else {
                return false;
            }
        }
    }

    /**
     * Keep track of the method invocations
     * */
    public class MethodInvocation {
        // The method name
        public String name;

        // The parameter types
        public List<Type> paramTypes;

        // The parameter names
        public List<String> paramNames;

        // The parameter values
        public List<Object> paramValues;

        // The parameter predicates
        public List<Func> predicates;

        // The method return type
        public Type returnType;

        // How to invoke this mock method
        private String invokeBy;

        // The mock return value
        private Object returnValue;

        // The mock exception
        private Exception e;

        // The mock answer
        private Func answer;

        // The history of all called arguments
        private List<List<Object>> history = new List<List<Object>>();

        /**
         * Establlish a mock behavior by returning the value
         *
         * Example:
         * T.when(mock.run(0)).thenReturn(0):
         * // When mock calls 'run' with 0, return 0
         *
         * @param value The return value
         * @return MethodInvocation
         * */
        public MethodInvocation thenReturn(Object value) {
            this.invokeBy = INVOKE_BY_RETURNING;
            this.returnValue = value;

            return this;
        }

        /**
         * Establish a mock behavior by throwing an exception
         *
         * Example:
         * T.when(mock.run(0)).thenThrow(new T.TestException('test'));
         * // When mock calls 'run' with 0, throw an exception
         *
         * @param e The exception
         * @return MethodInvocation
         * */
        public MethodInvocation thenThrow(Exception e) {
            this.invokeBy = INVOKE_BY_THROWING;
            this.e = e;

            return this;
        }

        /**
         * Establish a mock behavior by using the answer
         *
         * Example:
         * T.when(mock.run(0)).thenAnswer(R.inc);
         * // When mock calls 'run' with 0, return 1 as the computed by the answer
         *
         * @param answer The answer func
         * @return MethodInvocation
         * */
        public MethodInvocation thenAnswer(Func answer) {
            this.invokeBy = INVOKE_BY_ANSWERING;
            this.answer = answer;

            return this;
        }

        Object invoke(List<Object> paramValues) {
            this.history.add(paramValues);

            if(this.invokeBy == INVOKE_BY_RETURNING) {
                return this.returnValue;
            }
            else if(this.invokeBy == INVOKE_BY_THROWING) {
                throw this.e;
            }
            else if(this.invokeBy == INVOKE_BY_ANSWERING) {
                return this.answer.runN(paramValues);
            }

            return null;
        }

        Boolean canInvoke(String name, List<Type> paramTypes, List<Object> paramValues) {
            if(this.name == name && this.paramTypes == paramTypes) {
                if(this.predicates != null) {
                    for(Integer i = 0; i < paramValues.size(); i++) {
                        Object paramValue = paramValues.get(i);
                        Func pred = this.predicates.get(i);
                        Boolean pass = (Boolean)pred.run(paramValue);
                        if(!pass) {
                            return false;
                        }
                    }

                    return true;
                }
                else {
                    return this.paramValues == paramValues;
                }
            }

            return false;
        }
    }

    public class TestException extends Exception {
    }

    /**
     * Expecting Style Assertion
     * */
    public class Expect {
        // The opposite Expect
        public Expect never = null;

        // The internal value
        private Object value;

        // Whether to negate the result
        private Boolean negate;

        Expect(Object value, Boolean negate) {
            this.value = value;
            this.negate = negate;

            if(!this.negate) {
                this.never = new Expect(value, !this.negate);
            }
        }

        Expect(Object value) {
            this(value, false);
        }

        private Boolean decorate(Boolean result) {
            return this.negate ? !result : result;
        }

        /**
         * Expect the value to be the expected
         *
         * Example:
         * T.expect(true).toBe(true);
         * // Expect the result to be true
         *
         * @param expected The expected value
         * */
        public void toBe(Object expected) {
            this.toEqual(expected);
        }

        /**
         * Expect the value to equal with the expected
         *
         * Example:
         * T.expect(3).toEqual(3);
         * // Expect the result to equal with 3
         *
         * @param expected The expected value
         * */
        public void toEqual(Object expected) {
            Boolean result = (Boolean)R.equals.run(this.value, expected);

            result = decorate(result);

            System.assert(result, T.message('[{actual}] does not equal with [{expected}]', expected, this.value));
        }

        /**
         * Expect the value to equal with the asymmetric matcher
         *
         * Example:
         * T.expect('abc').toEqual(T.objectOfAnything());
         * // Expect the result to be anything but null
         *
         * @param matcher The asymmetric matcher
         * */
        public void toEqual(IMatcher matcher) {
            Boolean result = matcher.matches(this.value);

            result = decorate(result);

            System.assert(result, matcher.getMessage(this.value));
        }

        /**
         * Expect the value to match the expected
         *
         * Example:
         * T.expect('abc').toMatch('abc');
         * // Expect the result to match 'abc'
         *
         * @param expected The expected value
         * */
        public void toMatch(String expected) {
            Boolean result = (Boolean)R.test.run(expected, this.value);

            result = decorate(result);

            System.assert(result, T.message('[{actual}] does not match [{expected}]', expected, this.value));
        }

        /**
         * Expect the value to be null
         *
         * Example:
         * T.expect(null).toBeNull();
         * // Expect result to be null
         *
         * */
        public void toBeNull() {
            this.toBe(null);
        }

        /**
         * Expect the value to be true
         *
         * Example:
         * T.expect(true).toBeTrue();
         * // Expect the result to be true
         *
         * */
        public void toBeTrue() {
            this.toBe(true);
        }

        /**
         * Expect the value to be false
         *
         * Example:
         * T.expect(false).toBeFalse();
         * // Expect the result to be false
         *
         * */
        public void toBeFalse() {
            this.toBe(false);
        }

        /**
         * Expect the value to contain the expected value
         *
         * Example:
         * T.expect('abc').toContain('a');
         * // Expect the result to contain 'a'
         *
         * @param expected The expected value
         * */
        public void toContain(Object expected) {
            Boolean result = (Boolean)R.contains.run(expected, this.value);

            result = decorate(result);

            System.assert(result, T.message('[{actual}] does not contain [{expected}]', expected, this.value));
        }

        /**
         * Expect the value to be less than the expected value
         *
         * Example:
         * T.expect(2).toBeLessThan(3);
         * // Expect the result to be less than 3
         *
         * @param expected The expected value
         * */
        public void toBeLessThan(Object expected) {
            Boolean result = (Boolean)R.lt.run(this.value, expected);

            result = decorate(result);

            System.assert(result, T.message('[{actual}] is not less than[{expected}]', expected, this.value));
        }

        /**
         * Expect the value to be greater than the expected value
         *
         * Example:
         * T.expect(3).toBeGreaterThan(2);
         * // Expect the result to be greater than 2
         *
         * @param expected The expected value
         * */
        public void toBeGreaterThan(Object expected) {
            Boolean result = (Boolean)R.gt.run(this.value, expected);

            result = decorate(result);

            System.assert(result, T.message('[{actual}] is not greater than [{expected}]', expected, this.value));
        }
    }

    /**
     * The calls part of the verify object
     * */
    public class VerifyCalls {
        // Keep track of the method invocations
        private List<MethodInvocation> invocations = new List<MethodInvocation>();

        public VerifyCalls(List<MethodInvocation> invocations) {
            this.invocations = invocations;
        }

        /**
         * Get how many times the method invocations are called
         *
         * Example:
         * T.verify(mock, 'getName').calls.count();
         * // Get how many times mock.getName has been called
         *
         * @return Integer
         * */
        public Integer count() {
            Integer times = 0;

            for(MethodInvocation inv : this.invocations) {
                times += inv.history.size();
            }

            return times;
        }

        /**
         * Check if the method invocations are called
         *
         * Example:
         * T.verify(mock, 'getName').calls.any();
         * // Return whether the mock.getName has been called
         *
         * @return Boolean
         * */
        public Boolean any() {
            return this.count() != 0;
        }

        /**
         * Get all the called arguments
         *
         * Example:
         * T.verify(mock, 'getName').calls.allArgs();
         * // Get all the arguments list for mock.getName
         *
         * @return List<List<Object>>
         * */
        public List<List<Object>> allArgs() {
            List<List<Object>> args = new List<List<Object>>();

            for(MethodInvocation inv : this.invocations) {
                args.addAll(inv.history);
            }

            return args;
        }
    }

    /**
     * The object used to verify the behavior of the mock methods
     * */
    public class Verify {
        // The name of the method
        private String name;

        // The parameter types of the method
        private List<Type> paramTypes;

        // The object used to track the calls
        public VerifyCalls calls;

        Verify(List<MethodInvocation> invocations, String name, List<Type> paramTypes) {
            this.name = name;
            this.paramTypes = paramTypes;

            List<MethodInvocation> filteredInvocations = new List<MethodInvocation>();
            for(MethodInvocation inv : invocations) {
                if(inv.name == name && (paramTypes == null || inv.paramTypes == paramTypes)) {
                    filteredInvocations.add(inv);
                }
            }

            this.calls = new VerifyCalls(filteredInvocations);
        }

        /**
         * Verify that the method has been called
         *
         * Example:
         * T.verify(mock, 'getName').toHaveBeenCalled();
         * // Verify mock.getName has been called
         *
         * */
        public void toHaveBeenCalled() {
            System.assert(this.calls.any(), this.getSignature() + ' has never been called');
        }

        /**
         * Verify that the method has been called exactly N times
         *
         * Example:
         * T.verify(mock, 'getName').toHaveBeenCalledTimes(3);
         * // Verify mock.getName has been called 3 times
         *
         * @param count The called times
         * */
        public void toHaveBeenCalledTimes(Integer count) {
            Integer times = this.calls.count();
            System.assert(times == count, this.getSignature() + ' has been called ' + times + ' times, but expected was ' + count + ' times');
        }

        /**
         * Verify that the method has been called with the given arguments
         *
         * Example:
         * T.verify(mock, 'run').toHaveBeenCalledWith(new List<Object>{ 0 });
         * // Verify mock.run has been called with 0
         *
         * @param paramValues The argument values
         * */
        public void toHaveBeenCalledWith(List<Object> paramValues) {
            Boolean found = false;
            for(List<Object> pValues : this.calls.allArgs()) {
                if(pValues == paramValues) {
                    found = true;
                    break;
                }
            }

            System.assert(found, this.getSignature() + ' has never been called with such parameter values');
        }

        private String getSignature() {
            String s = this.name;

            if(this.paramTypes != null) {
                s += '(' + R.of(this.paramTypes).doMap(R.toString).doJoin(', ').toString() + ')';
            }
            else {
                s += '(...)';
            }

            return s;
        }
    }

    /**
     * The asymmetric matcher
     * */
    public interface IMatcher {
        Boolean matches(Object other);

        String getMessage(Object other);
    }

    class ListContainingMatcher implements IMatcher {
        private List<Object> mList;

        public ListContainingMatcher(List<Object> mList) {
            this.mList = mList;
        }

        public String getMessage(Object other) {
            String message = '[{actual}] does not contain [{expected}]';
            return T.message(message, this.mList, other);
        }

        public Boolean matches(Object other) {
            if(this.mList != null && other != null) {
                List<Object> otherList = (List<Object>)R.toList.run(other);

                for(Object element : this.mList) {
                    if(!otherList.contains(element)) {
                        return false;
                    }
                }

                return true;
            }

            return false;
        }
    }

    class MapContainingMatcher implements IMatcher {
        private Map<String, Object> data;

        public MapContainingMatcher(Map<String, Object> data) {
            this.data = data;
        }

        public String getMessage(Object other) {
            String message = '[{actual}] does not contain [{expected}]';
            return T.message(message, this.data, other);
        }

        public Boolean matches(Object other) {
            if(this.data != null && other != null) {
                Map<String, Object> otherMap = (Map<String, Object>)R.toMap.run(other);

                for(String key : this.data.keySet()) {
                    Object value = this.data.get(key);
                    if(value != otherMap.get(key)) {
                        return false;
                    }
                }

                return true;
            }

            return false;
        }
    }

    class AnythingMatcher implements IMatcher {
        public String getMessage(Object other) {
            String message = '[{actual}] is not anything';
            return T.message(message, null, other);
        }

        public Boolean matches(Object other) {
            return other != null;
        }
    }

    class AnyMatcher implements IMatcher {
        private Type typeOfAny;

        public AnyMatcher(Type typeOfAny) {
            this.typeOfAny = typeOfAny;
        }

        public String getMessage(Object other) {
            String message = '[{actual}] is not a type of [{expected}]';
            return T.message(message, this.typeOfAny.getName(), other);
        }

        public Boolean matches(Object other) {
            if(this.typeOfAny == Object.class) {
                return true;
            }
            else if(this.typeOfAny == Boolean.class) {
                return other instanceof Boolean;
            }
            else if(this.typeOfAny == Integer.class) {
                return other instanceof Integer;
            }
            else if(this.typeOfAny == Long.class) {
                return other instanceof Long;
            }
            else if(this.typeOfAny == Double.class) {
                return other instanceof Double;
            }
            else if(this.typeOfAny == Decimal.class) {
                return other instanceof Decimal;
            }
            else if(this.typeOfAny == String.class) {
                return other instanceof String;
            }
            else if(this.typeOfAny == List<Object>.class) {
                return other instanceof List<Object>;
            }
            else if(this.typeOfAny == Set<String>.class) {
                return other instanceof Set<String>;
            }
            else if(this.typeOfAny == Map<String, Object>.class) {
                return other instanceof Map<String, Object>;
            }
            else if(this.typeOfAny == SObject.class) {
                return other instanceof SObject;
            }
            else if(this.typeOfAny == Date.class) {
                return other instanceof Date;
            }
            else if(this.typeOfAny == Time.class) {
                return other instanceof Time;
            }
            else if(this.typeOfAny == Datetime.class) {
                return other instanceof Datetime;
            }
            else {
                return false;
            }
        }
    }
}
