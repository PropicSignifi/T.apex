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
 * Utility class that helps generate random data
 * */
public class Random {

    /**
     * Create random data of any type
     *
     * Example:
     * Random.anyObject.run(new Map<String, Object>{
     *     'type' => 'String',
     *     'config' => new Map<String, Object>{ 'min' => 5 }
     * })
     * // Create a random string that is not shorter than 5
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyObject = new ObjectFunc();

    /**
     * Create random data of Boolean
     *
     * Example:
     * Random.anyBoolean.run(new Map<String, Object>{
     *     'likelihood' => 60
     * })
     * // Create a random Boolean with a likelihood of 60% to be true
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyBoolean = new BooleanFunc();

    /**
     * Create random data of Integer
     *
     * Example:
     * Random.anyInteger.run(new Map<String, Object>{
     *     'min' => 5,
     *     'max' => 20
     * })
     * // Create a random Integer between 5(inclusive) and 20(exclusive)
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyInteger = new IntegerFunc();

    /**
     * Create random data of Long
     *
     * Example:
     * Random.anyLong.run(new Map<String, Object>{
     *     'min' => 5,
     *     'max' => 20
     * })
     * // Create a random Long between 5(inclusive) and 20(exclusive)
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyLong = new LongFunc();

    /**
     * Create random data of Double
     *
     * Example:
     * Random.anyDouble.run(new Map<String, Object>{
     *     'min' => 5,
     *     'max' => 20
     * })
     * // Create a random Double between 5(inclusive) and 20(exclusive)
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyDouble = new DoubleFunc();

    /**
     * Create random data of Decimal
     *
     * Example:
     * Random.anyDecimal.run(new Map<String, Object>{
     *     'min' => 5,
     *     'max' => 20
     * })
     * // Create a random Decimal between 5(inclusive) and 20(exclusive)
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyDecimal = new DecimalFunc();

    /**
     * Create random data of Char
     *
     * Example:
     * Random.anyChar.run(new Map<String, Object>{
     *     'alpha' => true
     * })
     * // Create a random Char that is an alphabetic
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyChar = new CharFunc();

    /**
     * Create random data of String
     *
     * Example:
     * Random.anyString.run(new Map<String, Object>{
     *     'alpha' => true,
     *     'min' => 5
     * })
     * // Create a random String that contains alphabetics and is no shorter than 5
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyString = new StringFunc();

    /**
     * Create random data of List
     *
     * Example:
     * Random.anyList.run(new Map<String, Object>{
     *     'type' => 'String',
     *     'min' => 5
     * })
     * // Create a random List that contains at least 5 strings
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyList = new ListFunc();

    /**
     * Create random data of Set
     *
     * Example:
     * Random.anySet.run(new Map<String, Object>{
     *     'min' => 5
     * })
     * // Create a random Set that contains at least 5 strings
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anySet = new SetFunc();

    /**
     * Create random data of Map
     *
     * Example:
     * Random.anyMap.run(new Map<String, Object>{
     *     'type' => 'String',
     *     'min' => 5
     * })
     * // Create a random Map that contains at least 5 String-String key-value pairs
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyMap = new MapFunc();

    /**
     * Create random data of Date
     *
     * Example:
     * Random.anyDate.run(new Map<String, Object>{
     *     'min' => Datetime.now().getTime(),
     *     'max' => Datetime.now().addYears(1).getTime()
     * })
     * // Create a random Date
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyDate = new DateFunc();

    /**
     * Create random data of Time
     *
     * Example:
     * Random.anyTime.run(new Map<String, Object>{
     *     'min' => Datetime.now().getTime(),
     *     'max' => Datetime.now().addYears(1).getTime()
     * })
     * // Create a random Time
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyTime = new TimeFunc();

    /**
     * Create random data of Datetime
     *
     * Example:
     * Random.anyDatetime.run(new Map<String, Object>{
     *     'min' => Datetime.now().getTime(),
     *     'max' => Datetime.now().addYears(1).getTime()
     * })
     * // Create a random Datetime
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyDatetime = new DatetimeFunc();

    /**
     * Create random data of Syllable
     *
     * Example:
     * Random.anySyllable.run(new Map<String, Object>{
     *     'length' => 4
     * })
     * // Create a random Syllable that is 4 letters long
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anySyllable = new SyllableFunc();

    /**
     * Create random data of Word
     *
     * Example:
     * Random.anyWord.run(new Map<String, Object>{
     *     'syllables' => 4
     * })
     * // Create a random Word that has 4 syllables
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyWord = new WordFunc();

    /**
     * Create random data of Sentence
     *
     * Example:
     * Random.anySentence.run(new Map<String, Object>{
     *     'words' => 20
     * })
     * // Create a random Sentence that has 20 words
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anySentence = new SentenceFunc();

    /**
     * Create random data of Paragraph
     *
     * Example:
     * Random.anyParagraph.run(new Map<String, Object>{
     *     'sentences' => 5
     * })
     * // Create a random Paragraph that has 5 sentences
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyParagraph = new ParagraphFunc();

    /**
     * Create random data of Gender
     *
     * Example:
     * Random.anyGender.run(new Map<String, Object>{
     *     'extra' => new List<String>{ 'Unisex' }
     * })
     * // Create a random Gender adding extra genders
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyGender = new GenderFunc();

    /**
     * Create random data of Firstname
     *
     * Example:
     * Random.anyFirstname.run()
     * // Create a random Firstname
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyFirstname = new FirstnameFunc();

    /**
     * Create random data of Lastname
     *
     * Example:
     * Random.anyLastname.run()
     * // Create a random Lastname
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyLastname = new LastnameFunc();

    /**
     * Create random data of Prefix
     *
     * Example:
     * Random.anyPrefix.run()
     * // Create a random Prefix
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyPrefix = new PrefixFunc();

    /**
     * Create random data of Suffix
     *
     * Example:
     * Random.anySuffix.run()
     * // Create a random Suffix
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anySuffix = new SuffixFunc();

    /**
     * Create random data of Name
     *
     * Example:
     * Random.anyName.run()
     * // Create a random Name
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyName = new NameFunc();

    /**
     * Create random data of Email
     *
     * Example:
     * Random.anyEmail.run()
     * // Create a random Email
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyEmail = new EmailFunc();

    /**
     * Create random data of Domain
     *
     * Example:
     * Random.anyDomain.run()
     * // Create a random Domain
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anyDomain = new DomainFunc();

    /**
     * Create random data of SObject
     *
     * Example:
     * Random.anySObject.run(new Map<String, Object>{
     *     'type' => 'Account'
     * })
     * // Create a random SObject
     *
     * @param options The optional options to control the random data
     * @return Object
     * */
    public static final Func anySObject = new SObjectFunc();

    /**
     * Add included fields when generating SObject
     *
     * @param typeName The type name of the SObject
     * @param fieldNames The field names to include
     * */
    public static void addIncludedFields(String typeName, Set<String> fieldNames) {
        Set<String> existingFieldNames = includedFields.get(typeName);
        if(existingFieldNames == null) {
            existingFieldNames = new Set<String>();
        }

        existingFieldNames.addAll(fieldNames);

        includedFields.put(typeName, existingFieldNames);
    }

    /**
     * Add excluded fields when generating SObject
     *
     * @param typeName The type name of the SObject
     * @param fieldNames The field names to exclude
     * */
    public static void addExcludedFields(String typeName, Set<String> fieldNames) {
        Set<String> existingFieldNames = excludedFields.get(typeName);
        if(existingFieldNames == null) {
            existingFieldNames = new Set<String>();
        }

        existingFieldNames.addAll(fieldNames);

        excludedFields.put(typeName, existingFieldNames);
    }

    private static final String CHARS_LOWER = 'abcdefghijklmnopqrstuvwxyz';
    private static final String CHARS_UPPER = CHARS_LOWER.toUpperCase();
    private static final String CHARS_SYMBOL = '!@#$%^&*()[]';
    private static final String CHARS_NUMBER = '0123456789';
    private static final String CHARS_CONSONANTS = 'bcdfghjklmnprstvwz';
    private static final String CHARS_VOWELS = 'aeiou';
    private static final String REGEX_PUNCTUATIONS = '^[\\.\\?;!:]$';

    public static final Integer MIN_INTEGER = -2147483647;
    public static final Integer MAX_INTEGER = 2147483647;
    public static final Long MIN_LONG = -9223372036854775807L;
    public static final Long MAX_LONG = 9223372036854775807L;
    public static final Double MIN_DOUBLE = MIN_LONG;
    public static final Double MAX_DOUBLE = MAX_LONG;
    public static final Decimal MIN_DECIMAL = MIN_LONG;
    public static final Decimal MAX_DECIMAL = MAX_LONG;

    private static Profile userProfile = [Select Id from Profile where Name = 'System Administrator'];

    private static final String GENDER_MALE = 'Male';
    private static final String GENDER_FEMALE = 'Female';
    private static final List<String> GENDERS = new List<String>{ GENDER_MALE, GENDER_FEMALE };

    private static final Map<String, Schema.SObjectType> GLOBAL_DESCRIBE = Schema.getGlobalDescribe();
    private static final Map<String, Map<String, Schema.SObjectField>> FIELD_MAP_CACHE = new Map<String, Map<String, Schema.SObjectField>>();
    private static final Map<String, String> DEFAULT_PICKLIST_VALUE = new Map<String, String>();

    private static final Map<String, List<String>> NAME_PREFIXES = new Map<String, List<String>>{
        'all' => new List<String>{ 'Dr.' },
        'male' => new List<String>{ 'Mr.' },
        'female' => new List<String>{ 'Miss', 'Mrs.' }
    };

    private static final List<String> NAME_SUFFIXES = new List<String>{
        'D.O.', 'Ph.D.', 'Esq.', 'Jr.', 'J.D.', 'M.A.', 'M.B.A.', 'M.S.', 'M.D.', 'Sr.', 'III', 'IV', 'B.E', 'B.TECH'
    };

    private static final List<String> TLDS = new List<String>{
        'com', 'org', 'edu', 'gov', 'co.uk', 'net', 'io', 'ac', 'ad', 'ae', 'af', 'ag', 'ai', 'al', 'am', 'an', 'ao', 'aq', 'ar', 'as', 'at', 'au', 'aw', 'ax', 'az', 'ba', 'bb', 'bd', 'be', 'bf', 'bg', 'bh', 'bi', 'bj', 'bm', 'bn', 'bo', 'bq', 'br', 'bs', 'bt', 'bv', 'bw', 'by', 'bz', 'ca', 'cc', 'cd', 'cf', 'cg', 'ch', 'ci', 'ck', 'cl', 'cm', 'cn', 'co', 'cr', 'cu', 'cv', 'cw', 'cx', 'cy', 'cz', 'de', 'dj', 'dk', 'dm', 'do', 'dz', 'ec', 'ee', 'eg', 'eh', 'er', 'es', 'et', 'eu', 'fi', 'fj', 'fk', 'fm', 'fo', 'fr', 'ga', 'gb', 'gd', 'ge', 'gf', 'gg', 'gh', 'gi', 'gl', 'gm', 'gn', 'gp', 'gq', 'gr', 'gs', 'gt', 'gu', 'gw', 'gy', 'hk', 'hm', 'hn', 'hr', 'ht', 'hu', 'id', 'ie', 'il', 'im', 'in', 'io', 'iq', 'ir', 'is', 'it', 'je', 'jm', 'jo', 'jp', 'ke', 'kg', 'kh', 'ki', 'km', 'kn', 'kp', 'kr', 'kw', 'ky', 'kz', 'la', 'lb', 'lc', 'li', 'lk', 'lr', 'ls', 'lt', 'lu', 'lv', 'ly', 'ma', 'mc', 'md', 'me', 'mg', 'mh', 'mk', 'ml', 'mm', 'mn', 'mo', 'mp', 'mq', 'mr', 'ms', 'mt', 'mu', 'mv', 'mw', 'mx', 'my', 'mz', 'na', 'nc', 'ne', 'nf', 'ng', 'ni', 'nl', 'no', 'np', 'nr', 'nu', 'nz', 'om', 'pa', 'pe', 'pf', 'pg', 'ph', 'pk', 'pl', 'pm', 'pn', 'pr', 'ps', 'pt', 'pw', 'py', 'qa', 're', 'ro', 'rs', 'ru', 'rw', 'sa', 'sb', 'sc', 'sd', 'se', 'sg', 'sh', 'si', 'sj', 'sk', 'sl', 'sm', 'sn', 'so', 'sr', 'ss', 'st', 'su', 'sv', 'sx', 'sy', 'sz', 'tc', 'td', 'tf', 'tg', 'th', 'tj', 'tk', 'tl', 'tm', 'tn', 'to', 'tp', 'tr', 'tt', 'tv', 'tw', 'tz', 'ua', 'ug', 'uk', 'us', 'uy', 'uz', 'va', 'vc', 've', 'vg', 'vi', 'vn', 'vu', 'wf', 'ws', 'ye', 'yt', 'za', 'zm', 'zw'
    };

    private static final List<String> MALE_FIRSTNAMES = new List<String>{
        'James', 'John', 'Robert', 'Michael', 'William', 'David', 'Richard', 'Joseph', 'Charles', 'Thomas', 'Christopher', 'Daniel', 'Matthew', 'George', 'Donald', 'Anthony', 'Paul', 'Mark', 'Edward', 'Steven', 'Kenneth', 'Andrew', 'Brian', 'Joshua', 'Kevin', 'Ronald', 'Timothy', 'Jason', 'Jeffrey', 'Frank', 'Gary', 'Ryan', 'Nicholas', 'Eric', 'Stephen', 'Jacob', 'Larry', 'Jonathan', 'Scott', 'Raymond', 'Justin', 'Brandon', 'Gregory', 'Samuel', 'Benjamin', 'Patrick', 'Jack', 'Henry', 'Walter', 'Dennis', 'Jerry', 'Alexander', 'Peter', 'Tyler', 'Douglas', 'Harold', 'Aaron', 'Jose', 'Adam', 'Arthur', 'Zachary', 'Carl', 'Nathan', 'Albert', 'Kyle', 'Lawrence', 'Joe', 'Willie', 'Gerald', 'Roger', 'Keith', 'Jeremy', 'Terry', 'Harry', 'Ralph', 'Sean', 'Jesse', 'Roy', 'Louis', 'Billy', 'Austin', 'Bruce', 'Eugene', 'Christian', 'Bryan', 'Wayne', 'Russell', 'Howard', 'Fred', 'Ethan', 'Jordan', 'Philip', 'Alan', 'Juan', 'Randy', 'Vincent', 'Bobby', 'Dylan', 'Johnny', 'Phillip', 'Victor', 'Clarence', 'Ernest', 'Martin', 'Craig', 'Stanley', 'Shawn', 'Travis', 'Bradley', 'Leonard', 'Earl', 'Gabriel', 'Jimmy', 'Francis', 'Todd', 'Noah', 'Danny', 'Dale', 'Cody', 'Carlos', 'Allen', 'Frederick', 'Logan', 'Curtis', 'Alex', 'Joel', 'Luis', 'Norman', 'Marvin', 'Glenn', 'Tony', 'Nathaniel', 'Rodney', 'Melvin', 'Alfred', 'Steve', 'Cameron', 'Chad', 'Edwin', 'Caleb', 'Evan', 'Antonio', 'Lee', 'Herbert', 'Jeffery', 'Isaac', 'Derek', 'Ricky', 'Marcus', 'Theodore', 'Elijah', 'Luke', 'Jesus', 'Eddie', 'Troy', 'Mike', 'Dustin', 'Ray', 'Adrian', 'Bernard', 'Leroy', 'Angel', 'Randall', 'Wesley', 'Ian', 'Jared', 'Mason', 'Hunter', 'Calvin', 'Oscar', 'Clifford', 'Jay', 'Shane', 'Ronnie', 'Barry', 'Lucas', 'Corey', 'Manuel', 'Leo', 'Tommy', 'Warren', 'Jackson', 'Isaiah', 'Connor', 'Don', 'Dean', 'Jon', 'Julian', 'Miguel', 'Bill', 'Lloyd', 'Charlie', 'Mitchell', 'Leon', 'Jerome', 'Darrell', 'Jeremiah', 'Alvin', 'Brett', 'Seth', 'Floyd', 'Jim', 'Blake', 'Micheal', 'Gordon', 'Trevor', 'Lewis', 'Erik', 'Edgar', 'Vernon', 'Devin', 'Gavin', 'Jayden', 'Chris', 'Clyde', 'Tom', 'Derrick', 'Mario', 'Brent', 'Marc', 'Herman', 'Chase', 'Dominic', 'Ricardo', 'Franklin', 'Maurice', 'Max', 'Aiden', 'Owen', 'Lester', 'Gilbert', 'Elmer', 'Gene', 'Francisco', 'Glen', 'Cory', 'Garrett', 'Clayton', 'Sam', 'Jorge', 'Chester', 'Alejandro', 'Jeff', 'Harvey', 'Milton', 'Cole', 'Ivan', 'Andre', 'Duane', 'Landon'
    };

    private static final List<String> FEMALE_FIRSTNAMES = new List<String>{
        'Mary', 'Emma', 'Elizabeth', 'Minnie', 'Margaret', 'Ida', 'Alice', 'Bertha', 'Sarah', 'Annie', 'Clara', 'Ella', 'Florence', 'Cora', 'Martha', 'Laura', 'Nellie', 'Grace', 'Carrie', 'Maude', 'Mabel', 'Bessie', 'Jennie', 'Gertrude', 'Julia', 'Hattie', 'Edith', 'Mattie', 'Rose', 'Catherine', 'Lillian', 'Ada', 'Lillie', 'Helen', 'Jessie', 'Louise', 'Ethel', 'Lula', 'Myrtle', 'Eva', 'Frances', 'Lena', 'Lucy', 'Edna', 'Maggie', 'Pearl', 'Daisy', 'Fannie', 'Josephine', 'Dora', 'Rosa', 'Katherine', 'Agnes', 'Marie', 'Nora', 'May', 'Mamie', 'Blanche', 'Stella', 'Ellen', 'Nancy', 'Effie', 'Sallie', 'Nettie', 'Della', 'Lizzie', 'Flora', 'Susie', 'Maud', 'Mae', 'Etta', 'Harriet', 'Sadie', 'Caroline', 'Katie', 'Lydia', 'Elsie', 'Kate', 'Susan', 'Mollie', 'Alma', 'Addie', 'Georgia', 'Eliza', 'Lulu', 'Nannie', 'Lottie', 'Amanda', 'Belle', 'Charlotte', 'Rebecca', 'Ruth', 'Viola', 'Olive', 'Amelia', 'Hannah', 'Jane', 'Virginia', 'Emily', 'Matilda', 'Irene', 'Kathryn', 'Esther', 'Willie', 'Henrietta', 'Ollie', 'Amy', 'Rachel', 'Sara', 'Estella', 'Theresa', 'Augusta', 'Ora', 'Pauline', 'Josie', 'Lola', 'Sophia', 'Leona', 'Anne', 'Mildred', 'Ann', 'Beulah', 'Callie', 'Lou', 'Delia', 'Eleanor', 'Barbara', 'Iva', 'Louisa', 'Maria', 'Mayme', 'Evelyn', 'Estelle', 'Nina', 'Betty', 'Marion', 'Bettie', 'Dorothy', 'Luella', 'Inez', 'Lela', 'Rosie', 'Allie', 'Millie', 'Janie', 'Cornelia', 'Victoria', 'Ruby', 'Winifred', 'Alta', 'Celia', 'Christine', 'Beatrice', 'Birdie', 'Harriett', 'Mable', 'Myra', 'Sophie', 'Tillie', 'Isabel', 'Sylvia', 'Carolyn', 'Isabelle', 'Leila', 'Sally', 'Ina', 'Essie', 'Bertie', 'Nell', 'Alberta', 'Katharine', 'Lora', 'Rena', 'Mina', 'Rhoda', 'Mathilda', 'Abbie', 'Eula', 'Dollie', 'Hettie', 'Eunice', 'Fanny', 'Ola', 'Lenora', 'Adelaide', 'Christina', 'Lelia', 'Nelle', 'Sue', 'Johanna', 'Lilly', 'Lucinda', 'Minerva', 'Lettie', 'Roxie', 'Cynthia', 'Helena', 'Hilda', 'Hulda', 'Bernice', 'Genevieve', 'Jean', 'Cordelia', 'Marian', 'Francis', 'Jeanette', 'Adeline', 'Gussie', 'Leah', 'Lois', 'Lura', 'Mittie', 'Hallie', 'Isabella', 'Olga', 'Phoebe', 'Teresa', 'Hester', 'Lida', 'Lina', 'Winnie', 'Claudia', 'Marguerite', 'Vera', 'Cecelia', 'Bess', 'Emilie', 'Rosetta', 'Verna', 'Myrtie', 'Cecilia', 'Elva', 'Olivia', 'Ophelia', 'Georgie', 'Elnora', 'Violet', 'Adele', 'Lily', 'Linnie', 'Loretta', 'Madge', 'Polly', 'Virgie', 'Eugenia', 'Lucile', 'Lucille', 'Mabelle', 'Rosalie'
    };

    private static final List<String> LASTNAMES = new List<String>{
        'Smith', 'Johnson', 'Williams', 'Jones', 'Brown', 'Davis', 'Miller', 'Wilson', 'Moore', 'Taylor', 'Anderson', 'Thomas', 'Jackson', 'White', 'Harris', 'Martin', 'Thompson', 'Garcia', 'Martinez', 'Robinson', 'Clark', 'Rodriguez', 'Lewis', 'Lee', 'Walker', 'Hall', 'Allen', 'Young', 'Hernandez', 'King', 'Wright', 'Lopez', 'Hill', 'Scott', 'Green', 'Adams', 'Baker', 'Gonzalez', 'Nelson', 'Carter', 'Mitchell', 'Perez', 'Roberts', 'Turner', 'Phillips', 'Campbell', 'Parker', 'Evans', 'Edwards', 'Collins', 'Stewart', 'Sanchez', 'Morris', 'Rogers', 'Reed', 'Cook', 'Morgan', 'Bell', 'Murphy', 'Bailey', 'Rivera', 'Cooper', 'Richardson', 'Cox', 'Howard', 'Ward', 'Torres', 'Peterson', 'Gray', 'Ramirez', 'James', 'Watson', 'Brooks', 'Kelly', 'Sanders', 'Price', 'Bennett', 'Wood', 'Barnes', 'Ross', 'Henderson', 'Coleman', 'Jenkins', 'Perry', 'Powell', 'Long', 'Patterson', 'Hughes', 'Flores', 'Washington', 'Butler', 'Simmons', 'Foster', 'Gonzales', 'Bryant', 'Alexander', 'Russell', 'Griffin', 'Diaz', 'Hayes', 'Myers', 'Ford', 'Hamilton', 'Graham', 'Sullivan', 'Wallace', 'Woods', 'Cole', 'West', 'Jordan', 'Owens', 'Reynolds', 'Fisher', 'Ellis', 'Harrison', 'Gibson', 'McDonald', 'Cruz', 'Marshall', 'Ortiz', 'Gomez', 'Murray', 'Freeman', 'Wells', 'Webb', 'Simpson', 'Stevens', 'Tucker', 'Porter', 'Hunter', 'Hicks', 'Crawford', 'Henry', 'Boyd', 'Mason', 'Morales', 'Kennedy', 'Warren', 'Dixon', 'Ramos', 'Reyes', 'Burns', 'Gordon', 'Shaw', 'Holmes', 'Rice', 'Robertson', 'Hunt', 'Black', 'Daniels', 'Palmer', 'Mills', 'Nichols', 'Grant', 'Knight', 'Ferguson', 'Rose', 'Stone', 'Hawkins', 'Dunn', 'Perkins', 'Hudson', 'Spencer', 'Gardner', 'Stephens', 'Payne', 'Pierce', 'Berry', 'Matthews', 'Arnold', 'Wagner', 'Willis', 'Ray', 'Watkins', 'Olson', 'Carroll', 'Duncan', 'Snyder', 'Hart', 'Cunningham', 'Bradley', 'Lane', 'Andrews', 'Ruiz', 'Harper', 'Fox', 'Riley', 'Armstrong', 'Carpenter', 'Weaver', 'Greene', 'Lawrence', 'Elliott', 'Chavez', 'Sims', 'Austin', 'Peters', 'Kelley', 'Franklin', 'Lawson', 'Fields', 'Gutierrez', 'Ryan', 'Schmidt', 'Carr', 'Vasquez', 'Castillo', 'Wheeler', 'Chapman', 'Oliver', 'Montgomery', 'Richards', 'Williamson', 'Johnston', 'Banks', 'Meyer', 'Bishop', 'McCoy', 'Howell', 'Alvarez', 'Morrison', 'Hansen', 'Fernandez', 'Garza', 'Harvey', 'Little', 'Burton', 'Stanley', 'Nguyen', 'George', 'Jacobs', 'Reid', 'Kim', 'Fuller', 'Lynch', 'Dean', 'Gilbert', 'Garrett', 'Romero', 'Welch', 'Larson', 'Frazier', 'Burke', 'Hanson', 'Day', 'Mendoza', 'Moreno', 'Bowman', 'Medina', 'Fowler', 'Brewer', 'Hoffman', 'Carlson', 'Silva', 'Pearson', 'Holland', 'Douglas', 'Fleming', 'Jensen', 'Vargas', 'Byrd', 'Davidson', 'Hopkins', 'May', 'Terry', 'Herrera', 'Wade', 'Soto', 'Walters', 'Curtis', 'Neal', 'Caldwell', 'Lowe', 'Jennings', 'Barnett', 'Graves', 'Jimenez', 'Horton', 'Shelton', 'Barrett', 'Obrien', 'Castro', 'Sutton', 'Gregory', 'McKinney', 'Lucas', 'Miles', 'Craig', 'Rodriquez', 'Chambers', 'Holt', 'Lambert', 'Fletcher', 'Watts', 'Bates', 'Hale', 'Rhodes', 'Pena', 'Beck', 'Newman', 'Haynes', 'McDaniel', 'Mendez', 'Bush', 'Vaughn', 'Parks', 'Dawson', 'Santiago', 'Norris', 'Hardy', 'Love', 'Steele', 'Curry', 'Powers', 'Schultz', 'Barker', 'Guzman', 'Page', 'Munoz', 'Ball', 'Keller', 'Chandler', 'Weber', 'Leonard', 'Walsh', 'Lyons', 'Ramsey', 'Wolfe', 'Schneider', 'Mullins', 'Benson', 'Sharp', 'Bowen', 'Daniel', 'Barber', 'Cummings', 'Hines', 'Baldwin', 'Griffith', 'Valdez', 'Hubbard', 'Salazar', 'Reeves', 'Warner', 'Stevenson', 'Burgess', 'Santos', 'Tate', 'Cross', 'Garner', 'Mann', 'Mack', 'Moss', 'Thornton', 'Dennis', 'McGee', 'Farmer', 'Delgado', 'Aguilar', 'Vega', 'Glover', 'Manning', 'Cohen', 'Harmon', 'Rodgers', 'Robbins', 'Newton', 'Todd', 'Blair', 'Higgins', 'Ingram', 'Reese', 'Cannon', 'Strickland', 'Townsend', 'Potter', 'Goodwin', 'Walton', 'Rowe', 'Hampton', 'Ortega', 'Patton', 'Swanson', 'Joseph', 'Francis', 'Goodman', 'Maldonado', 'Yates', 'Becker', 'Erickson', 'Hodges', 'Rios', 'Conner', 'Adkins', 'Webster', 'Norman', 'Malone', 'Hammond', 'Flowers', 'Cobb', 'Moody', 'Quinn', 'Blake', 'Maxwell', 'Pope', 'Floyd', 'Osborne', 'Paul', 'McCarthy', 'Guerrero', 'Lindsey', 'Estrada', 'Sandoval', 'Gibbs', 'Tyler', 'Gross', 'Fitzgerald', 'Stokes', 'Doyle', 'Sherman', 'Saunders', 'Wise', 'Colon', 'Gill', 'Alvarado', 'Greer', 'Padilla', 'Simon', 'Waters', 'Nunez', 'Ballard', 'Schwartz', 'McBride', 'Houston', 'Christensen', 'Klein', 'Pratt', 'Briggs', 'Parsons', 'McLaughlin', 'Zimmerman', 'French', 'Buchanan', 'Moran', 'Copeland', 'Roy', 'Pittman', 'Brady', 'McCormick', 'Holloway', 'Brock', 'Poole', 'Frank', 'Logan', 'Owen', 'Bass', 'Marsh', 'Drake', 'Wong', 'Jefferson', 'Park', 'Morton', 'Abbott', 'Sparks', 'Patrick', 'Norton', 'Huff', 'Clayton', 'Massey', 'Lloyd', 'Figueroa', 'Carson', 'Bowers', 'Roberson', 'Barton', 'Tran', 'Lamb', 'Harrington', 'Casey', 'Boone', 'Cortez', 'Clarke', 'Mathis', 'Singleton', 'Wilkins', 'Cain', 'Bryan', 'Underwood', 'Hogan', 'McKenzie', 'Collier', 'Luna', 'Phelps', 'McGuire', 'Allison', 'Bridges', 'Wilkerson', 'Nash', 'Summers', 'Atkins'
    };

    private static Map<String, Set<String>> excludedFields = new Map<String, Set<String>>{
		'All' => new Set<String>{'OwnerId', 'LastModifiedById', 'CreatedById', 'LastModifiedDate', 'CreatedDate'},
		'Account' => new Set<String>{'FirstName', 'LastName'},
		'User' => new Set<String>{'IsActive', 'DelegatedApproverId', 'CallCenterId', 'ContactId', 'DelegatedApproverId', 'ManagerId', 'UserRoleId', 'FederationIdentifier' }
	};

	private static Map<String, Set<String>> includedFields = new Map<String, Set<String>>();

    private static Double random() {
        return Math.random();
    }

    private static String getDefaultPicklistValue(SObject obj, Schema.DescribeFieldResult fieldDescribe) {
		String key = obj.getSObjectType() + '.' + fieldDescribe.getName();

		if (!DEFAULT_PICKLIST_VALUE.containsKey(key)) {
			List<Schema.PicklistEntry> entries = fieldDescribe.getPicklistValues();
			String value = entries.size() > 0 ? entries[0].getValue() : null;
			DEFAULT_PICKLIST_VALUE.put(key, value);
		}

		return DEFAULT_PICKLIST_VALUE.get(key);
	}

    private static Map<String, Schema.SObjectField> getFieldMap(String type) {
		Map<String, Schema.SObjectField> fieldMap = null;
		String normalizedType = type.toLowerCase();

		if (FIELD_MAP_CACHE.containsKey(normalizedType)) {
			fieldMap = FIELD_MAP_CACHE.get(normalizedType);
		} else {
			fieldMap = GLOBAL_DESCRIBE.get(type).getDescribe().fields.getMap();
			FIELD_MAP_CACHE.put(normalizedType, fieldMap);
		}

		return fieldMap;
	}


	private static Boolean isExcludedField(Schema.DescribeFieldResult fieldDescribe) {
		return excludedFields.get('All').contains(fieldDescribe.getName());
	}

	private static Boolean isExcludedField(SObject obj, Schema.DescribeFieldResult fieldDescribe) {
		Set<String> fields = excludedFields.get(obj.getSObjectType().getDescribe().getName());
		return fields == null ? false : fields.contains(fieldDescribe.getName());
	}

	private static Boolean isIncludedField(SObject obj, Schema.DescribeFieldResult fieldDescribe) {
		Set<String> fields = includedFields.get(obj.getSObjectType().getDescribe().getName());
		return fields == null ? false : fields.contains(fieldDescribe.getName());
	}

    private static Boolean shouldFillField(SObject obj, Schema.DescribeFieldResult fieldDescribe, boolean cascade, List<String> requestedFields) {
        return fieldDescribe.isCreateable() && (
            isIncludedField(obj, fieldDescribe) || (
                (!fieldDescribe.isNillable() ||
                    (fieldDescribe.getType() == Schema.DisplayType.Reference && cascade)
                ) &&
                !isExcludedField(fieldDescribe) &&
                !isExcludedField(obj, fieldDescribe)
            ) ||
            (requestedFields != null && requestedFields.contains(fieldDescribe.getName()))
        );
    }

    private static void setRecordType(SObject obj) {
		List<Schema.RecordTypeInfo> recordTypes = obj.getSObjectType().getDescribe().getRecordTypeInfos();

		if (recordTypes.size() > 1) { // all objects have default Master type
			for (Schema.RecordTypeInfo recordType : recordTypes) {
				if (recordType.isAvailable() && recordType.isDefaultRecordTypeMapping()) {
					obj.put('RecordTypeId', recordType.getRecordTypeId());
				}
			}
		}
	}

    private static void setFieldValue(SObject obj, Schema.SObjectField field, boolean cascade, List<String> requestedFields) {
		Schema.DescribeFieldResult fieldDescribe = field.getDescribe();

		if (shouldFillField(obj, fieldDescribe, cascade, requestedFields)) {
			if (fieldDescribe.getType() == Schema.DisplayType.base64) {
				obj.put(field, Blob.valueOf(String.valueOf(Random.anyParagraph.run())));
			} else if (fieldDescribe.getType() == Schema.DisplayType.Boolean) {
				obj.put(field, Random.anyBoolean.run());
			} else if (fieldDescribe.getType() == Schema.DisplayType.Combobox) {
				obj.put(field, Random.anyWord.run());
			} else if (fieldDescribe.getType() == Schema.DisplayType.Currency) {
				obj.put(field, Random.anyInteger.run());
			} else if (fieldDescribe.getType() == Schema.DisplayType.Date) {
				obj.put(field, Random.anyDate.run());
			} else if (fieldDescribe.getType() == Schema.DisplayType.Datetime) {
				obj.put(field, Random.anyDatetime.run());
			} else if (fieldDescribe.getType() == Schema.DisplayType.Double) {
				obj.put(field, Random.anyDouble.run());
			} else if (fieldDescribe.getType() == Schema.DisplayType.Email) {
				obj.put(field, Random.anyEmail.run());
			} else if (fieldDescribe.getType() == Schema.DisplayType.EncryptedString) {
				obj.put(field, Random.anyParagraph.run());
			} else if (fieldDescribe.getType() == Schema.DisplayType.Id) {
			} else if (fieldDescribe.getType() == Schema.DisplayType.Integer) {
				obj.put(field, Random.anyInteger.run());
			} else if (fieldDescribe.getType() == Schema.DisplayType.MultiPicklist) {
				obj.put(field, getDefaultPicklistValue(obj, fieldDescribe));
			} else if (fieldDescribe.getType() == Schema.DisplayType.Percent) {
				obj.put(field, Random.anyInteger.run(0, 100));
			} else if (fieldDescribe.getType() == Schema.DisplayType.Phone) {
                obj.put(field, Random.anyString.run(new Map<String, Object>{
                    'numbers' => true,
                    'length' => 10
                }));
			} else if (fieldDescribe.getType() == Schema.DisplayType.Picklist) {
				obj.put(field, getDefaultPicklistValue(obj, fieldDescribe));
			} else if (fieldDescribe.getName() == 'CommunityNickname' && fieldDescribe.getType() == Schema.DisplayType.String) {
				obj.put(field, Random.anyFirstname.run() );
			} else if (fieldDescribe.getName() == 'UserName' && fieldDescribe.getType() == Schema.DisplayType.String) {
				obj.put(field, Random.anyEmail.run());
			} else if (fieldDescribe.getType() == Schema.DisplayType.String) {
				obj.put(field, Random.anySentence.run());
			} else if (fieldDescribe.getType() == Schema.DisplayType.Reference) {
				String referenceObjectType = fieldDescribe.getReferenceTo()[0].getDescribe().getName();

				if (referenceObjectType == 'RecordType') {
					setRecordType(obj);
                } else if (referenceObjectType == 'Profile') {
					obj.put(field, userProfile.Id);
				} else if (cascade && referenceObjectType != obj.getSObjectType().getDescribe().getName() && referenceObjectType != 'BusinessHours') {
                    SObject reference = (SObject)Random.anySObject.run(new Map<String, Object>{
                        'type' => referenceObjectType,
                        'cascade' => cascade
                    });
					insert reference;
					obj.put(field, reference.Id);
				}
			} else if (fieldDescribe.getType() == Schema.DisplayType.TextArea) {
				obj.put(field, Random.anyParagraph.run());
			} else if (fieldDescribe.getType() == Schema.DisplayType.Time) {
				obj.put(field, Random.anyTime.run());
			} else if (fieldDescribe.getType() == Schema.DisplayType.URL) {
				obj.put(field, 'https://' + (String)Random.anyDomain.run());
			}
		}
	}


    private class ObjectFunc extends Func {
        public ObjectFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            String type = (String)R.defaultTo.run(null, data.get('type'));
            Object config = data.get('config');

            if(type == 'Boolean') {
                return Random.anyBoolean.run(config);
            }
            else if(type == 'Integer') {
                return Random.anyInteger.run(config);
            }
            else if(type == 'Long') {
                return Random.anyLong.run(config);
            }
            else if(type == 'Double') {
                return Random.anyDouble.run(config);
            }
            else if(type == 'Decimal') {
                return Random.anyDecimal.run(config);
            }
            else if(type == 'Char') {
                return Random.anyChar.run(config);
            }
            else if(type == 'String') {
                return Random.anyString.run(config);
            }
            else if(type == 'List') {
                return Random.anyList.run(config);
            }
            else if(type == 'Set') {
                return Random.anySet.run(config);
            }
            else if(type == 'Map') {
                return Random.anyMap.run(config);
            }
            else if(type == 'Date') {
                return Random.anyDate.run(config);
            }
            else if(type == 'Time') {
                return Random.anyTime.run(config);
            }
            else if(type == 'Datetime') {
                return Random.anyDatetime.run(config);
            }
            else if(type == 'Syllable') {
                return Random.anySyllable.run(config);
            }
            else if(type == 'Word') {
                return Random.anyWord.run(config);
            }
            else if(type == 'Sentence') {
                return Random.anySentence.run(config);
            }
            else if(type == 'Paragraph') {
                return Random.anyParagraph.run(config);
            }
            else if(type == 'Gender') {
                return Random.anyGender.run(config);
            }
            else if(type == 'Firstname') {
                return Random.anyFirstname.run(config);
            }
            else if(type == 'Lastname') {
                return Random.anyLastname.run(config);
            }
            else if(type == 'Prefix') {
                return Random.anyPrefix.run(config);
            }
            else if(type == 'Suffix') {
                return Random.anySuffix.run(config);
            }
            else if(type == 'Name') {
                return Random.anyName.run(config);
            }
            else if(type == 'Email') {
                return Random.anyEmail.run(config);
            }
            else if(type == 'Domain') {
                return Random.anyDomain.run(config);
            }
            else if(type == 'SObject') {
                return Random.anySObject.run(config);
            }
            else if(type != null) {
                System.Type newType = System.Type.forName(type);
                return newType.newInstance();
            }
            else {
                return null;
            }
        }
    }

    private class BooleanFunc extends Func {
        public BooleanFunc() {
            super(-1);
        }

        public override Object exec() {
            return exec(50);
        }

        public override Object exec(Object arg) {
            Integer likelihood = null;
            if((Boolean)R.isMapLike.run(arg)) {
                Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);
                likelihood = (Integer)R.defaultTo.run(50, data.get('likelihood'));
            }
            else {
                likelihood = (Integer)R.toInteger.run(arg);
            }

            return random() * 100 < likelihood;
        }
    }

    private class IntegerFunc extends Func {
        public IntegerFunc() {
            super(-1);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Integer min = (Integer)R.defaultTo.run(MIN_INTEGER, data.get('min'));
            Integer max = (Integer)R.defaultTo.run(MAX_INTEGER, data.get('max'));

            return (Integer)Math.floor(random() * (max - min) + min);
        }

        public override Object exec(Object arg1, Object arg2) {
            return this.exec(new Map<String, Object>{
                'min' => arg1,
                'max' => arg2
            });
        }
    }

    private class LongFunc extends Func {
        public LongFunc() {
            super(-1);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Long min = (Long)R.defaultTo.run(MIN_LONG, data.get('min'));
            Long max = (Long)R.defaultTo.run(MAX_LONG, data.get('max'));

            return (Long)Math.floor(random() * (max - min) + min);
        }

        public override Object exec(Object arg1, Object arg2) {
            return this.exec(new Map<String, Object>{
                'min' => arg1,
                'max' => arg2
            });
        }
    }

    private class DoubleFunc extends Func {
        public DoubleFunc() {
            super(-1);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Double min = (Double)R.defaultTo.run(MIN_DOUBLE, data.get('min'));
            Double max = (Double)R.defaultTo.run(MAX_DOUBLE, data.get('max'));

            return (Double)Math.floor(random() * (max - min) + min);
        }

        public override Object exec(Object arg1, Object arg2) {
            return this.exec(new Map<String, Object>{
                'min' => arg1,
                'max' => arg2
            });
        }
    }

    private class DecimalFunc extends Func {
        public DecimalFunc() {
            super(-1);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Decimal min = (Decimal)R.defaultTo.run(MIN_DECIMAL, data.get('min'));
            Decimal max = (Decimal)R.defaultTo.run(MAX_DECIMAL, data.get('max'));

            return (Decimal)Math.floor(random() * (max - min) + min);
        }

        public override Object exec(Object arg1, Object arg2) {
            return this.exec(new Map<String, Object>{
                'min' => arg1,
                'max' => arg2
            });
        }
    }

    private class CharFunc extends Func {
        public CharFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);
            String casing = (String)R.defaultTo.run(null, data.get('casing'));
            String pool = (String)R.defaultTo.run(null, data.get('pool'));
            Boolean alpha = (Boolean)R.defaultTo.run(false, data.get('alpha'));
            Boolean symbols = (Boolean)R.defaultTo.run(false, data.get('symbols'));
            Boolean numbers = (Boolean)R.defaultTo.run(false, data.get('numbers'));

            String letters = CHARS_LOWER + CHARS_UPPER;
            if(casing == 'lower') {
                letters = CHARS_LOWER;
            }
            else if(casing == 'upper') {
                letters = CHARS_UPPER;
            }

            if(pool == null) {
                if(alpha) {
                    pool = letters;
                }
                else if(symbols) {
                    pool = CHARS_SYMBOL;
                }
                else if(numbers) {
                    pool = CHARS_NUMBER;
                }
                else {
                    pool = letters + CHARS_NUMBER + CHARS_SYMBOL;
                }
            }

            Integer index = (Integer)Random.anyInteger.run(0, pool.length());
            return pool.substring(index, index + 1);
        }
    }

    private class StringFunc extends Func {
        public StringFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Integer min = (Integer)R.defaultTo.run(0, data.get('min'));
            Integer max = (Integer)R.defaultTo.run(20, data.get('max'));

            Integer length = (Integer)Random.anyInteger.run(min, max);
            List<String> mCharList = new List<String>();
            for(Integer i = 0; i < length; i++) {
                mCharList.add((String)Random.anyChar.run(data));
            }

            return String.join(mCharList, '');
        }
    }

    private class ListFunc extends Func {
        public ListFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Integer min = (Integer)R.defaultTo.run(0, data.get('min'));
            Integer max = (Integer)R.defaultTo.run(20, data.get('max'));
            String type = (String)R.defaultTo.run(null, data.get('type'));
            Object config = data.get('config');

            Integer length = (Integer)Random.anyInteger.run(min, max);
            if((Boolean)R.isListLike.run(data.get('pool'))) {
                List<Object> pool = (List<Object>)R.toList.run(data.get('pool'));

                return R.sampleSize.run(length, pool);
            }
            else {
                List<Object> mList = new List<Object>();

                for(Integer i = 0; i < length; i++) {
                    Object value = Random.anyObject.run(data);
                    mList.add(value);
                }

                return mList;
            }
        }
    }

    private class SetFunc extends Func {
        public SetFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Integer min = (Integer)R.defaultTo.run(0, data.get('min'));
            Integer max = (Integer)R.defaultTo.run(20, data.get('max'));
            String type = 'String';
            Object config = data.get('config');

            Integer length = (Integer)Random.anyInteger.run(min, max);
            if((Boolean)R.isSetLike.run(data.get('pool'))) {
                Set<String> pool = (Set<String>)R.toSet.run(data.get('pool'));

                List<String> mList = new List<String>(pool);
                return new Set<String>(R.of(mList).sampleSize(length).toStringList());
            }
            else {
                Set<String> mSet = new Set<String>();

                data.put('type', type);
                for(Integer i = 0; i < length; i++) {
                    String value = (String)R.toString.run(Random.anyObject.run(data));
                    mSet.add(value);
                }

                return mSet;
            }
        }
    }

    private class MapFunc extends Func {
        public MapFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Integer min = (Integer)R.defaultTo.run(0, data.get('min'));
            Integer max = (Integer)R.defaultTo.run(20, data.get('max'));
            String type = (String)R.defaultTo.run(null, data.get('type'));
            Object config = data.get('config');

            Integer length = (Integer)Random.anyInteger.run(min, max);
            if((Boolean)R.isMapLike.run(data.get('pool'))) {
                Map<String, Object> pool = (Map<String, Object>)R.toMap.run(data.get('pool'));

                Set<String> mSet = (Set<String>)Random.anySet.run(new Map<String, Object>{
                    'pool' => pool.keySet(),
                    'min' => min,
                    'max' => max
                });

                Map<String, Object> result = new Map<String, Object>();
                for(String key : mSet) {
                    result.put(key, pool.get(key));
                }

                return result;
            }
            else {
                Set<String> mSet = (Set<String>)Random.anySet.run(new Map<String, Object>{
                    'min' => min,
                    'max' => max
                });

                Map<String, Object> result = new Map<String, Object>();
                for(String key : mSet) {
                    Object value = Random.anyObject.run(data);
                    result.put(key, value);
                }

                return result;
            }
        }
    }

    private class DateFunc extends Func {
        public DateFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Long min = (Long)R.defaultTo.run(Datetime.now().getTime(), data.get('min'));
            Long max = (Long)R.defaultTo.run(Datetime.now().addYears(20).getTime(), data.get('max'));

            Long num = (Long)Random.anyLong.run(min, max);
            return Datetime.newInstance(num).date();
        }
    }

    private class TimeFunc extends Func {
        public TimeFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Long min = (Long)R.defaultTo.run(Datetime.now().getTime(), data.get('min'));
            Long max = (Long)R.defaultTo.run(Datetime.now().addDays(1).getTime(), data.get('max'));

            Long num = (Long)Random.anyLong.run(min, max);
            return Datetime.newInstance(num).time();
        }
    }

    private class DatetimeFunc extends Func {
        public DatetimeFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Long min = (Long)R.defaultTo.run(Datetime.now().getTime(), data.get('min'));
            Long max = (Long)R.defaultTo.run(Datetime.now().addYears(20).getTime(), data.get('max'));

            Long num = (Long)Random.anyLong.run(min, max);
            return Datetime.newInstance(num);
        }
    }

    private class SyllableFunc extends Func {
        public SyllableFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Integer length = (Integer)R.defaultTo.run(Random.anyInteger.run(2, 3), data.get('length'));
            Boolean capitalize = (Boolean)R.defaultTo.run(false, data.get('capitalize'));

            String all = CHARS_CONSONANTS + CHARS_VOWELS;

            String text = '';
            String ch = null;

            for(Integer i = 0; i < length; i++) {
                if(i == 0) {
                    ch = (String)Random.anyChar.run(new Map<String, Object>{ 'pool' => all });
                }
                else if(CHARS_CONSONANTS.indexOf(ch) == -1) {
                    ch = (String)Random.anyChar.run(new Map<String, Object>{ 'pool' => CHARS_CONSONANTS });
                }
                else {
                    ch = (String)Random.anyChar.run(new Map<String, Object>{ 'pool' => CHARS_VOWELS });
                }

                text += ch;
            }

            if(capitalize) {
                return text.capitalize();
            }
            else {
                return text;
            }
        }
    }

    private class WordFunc extends Func {
        public WordFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Integer syllables = (Integer)R.defaultTo.run(Random.anyInteger.run(1, 3), data.get('syllables'));
            Integer length = (Integer)R.defaultTo.run(null, data.get('length'));
            Boolean capitalize = (Boolean)R.defaultTo.run(false, data.get('capitalize'));

            String text = '';

            if(length != null) {
                while(text.length() < length) {
                    text += (String)Random.anySyllable.run(data);
                }

                text = text.substring(0, length);
            }
            else {
                for(Integer i = 0; i < syllables; i++) {
                    text += (String)Random.anySyllable.run(data);
                }
            }

            return text;
        }
    }

    private class SentenceFunc extends Func {
        public SentenceFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Integer words = (Integer)R.defaultTo.run(Random.anyInteger.run(12, 18), data.get('words'));
            String punctuation = (String)R.defaultTo.run('.', data.get('punctuation'));

            List<String> wordList = new List<String>();
            for(Integer i = 0; i < words; i++) {
                wordList.add((String)Random.anyWord.run(data));
            }

            String text = String.join(wordList, ' ');

            text = text.capitalize();

            if(!Pattern.matches(REGEX_PUNCTUATIONS, punctuation)) {
                punctuation = '.';
            }

            return text + punctuation;
        }
    }

    private class ParagraphFunc extends Func {
        public ParagraphFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Integer sentences = (Integer)R.defaultTo.run(Random.anyInteger.run(3, 7), data.get('sentences'));

            List<String> sentenceList = new List<String>();

            for(Integer i = 0; i < sentences; i++) {
                sentenceList.add((String)Random.anySentence.run(data));
            }

            return String.join(sentenceList, ' ');
        }
    }

    private class GenderFunc extends Func {
        public GenderFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            List<String> extra = (List<String>)R.defaultTo.run(new List<String>(), data.get('extra'));

            return R.of(GENDERS).concat(extra).sample().toString();
        }
    }

    private class FirstnameFunc extends Func {
        public FirstnameFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            String gender = (String)R.defaultTo.run(null, data.get('gender'));

            List<String> names = null;
            if(gender == GENDER_MALE) {
                names = MALE_FIRSTNAMES;
            }
            else if(gender == GENDER_FEMALE) {
                names = FEMALE_FIRSTNAMES;
            }
            else {
                names = R.of(MALE_FIRSTNAMES).concat(FEMALE_FIRSTNAMES).toStringList();
            }

            return R.of(names).sample().toString();
        }
    }

    private class LastnameFunc extends Func {
        public LastnameFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            List<String> names = LASTNAMES;

            return R.of(names).sample().toString();
        }
    }


    private class PrefixFunc extends Func {
        public PrefixFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            String gender = (String)R.defaultTo.run(null, data.get('gender'));

            List<String> prefixes = null;
            if(gender == 'all') {
                prefixes = NAME_PREFIXES.get('all');
            }
            else if(gender == GENDER_MALE) {
                prefixes = NAME_PREFIXES.get(GENDER_MALE);
            }
            else if(gender == GENDER_FEMALE) {
                prefixes = NAME_PREFIXES.get(GENDER_FEMALE);
            }
            else {
                prefixes = R.of(NAME_PREFIXES).values().flatten().toStringList();
            }

            return R.of(prefixes).sample().toString();
        }
    }

    private class SuffixFunc extends Func {
        public SuffixFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            return R.of(NAME_SUFFIXES).sample().toString();
        }
    }

    private class NameFunc extends Func {
        public NameFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Boolean middle = (Boolean)R.defaultTo.run(false, data.get('middle'));
            Boolean middleInitial = (Boolean)R.defaultTo.run(false, data.get('middleInitial'));
            Boolean prefix = (Boolean)R.defaultTo.run(false, data.get('prefix'));
            Boolean suffix = (Boolean)R.defaultTo.run(false, data.get('suffix'));

            String first = (String)Random.anyFirstname.run(data);
            String last = (String)Random.anyLastname.run(data);

            String name = null;
            if(middle) {
                name = first + ' ' + (String)Random.anyFirstname.run(data) + ' ' + last;
            }
            else if(middleInitial) {
                name = first + ' ' + (String)Random.anyChar.run(new Map<String, Object>{
                    'alpha' => true,
                    'casing' => 'upper'
                }) + ' ' + last;
            }
            else {
                name = first + ' ' + last;
            }

            if(prefix) {
                name = (String)Random.anyPrefix.run(data) + ' ' + name;
            }

            if(suffix) {
                name = name + ' ' + (String)Random.anySuffix.run(data);
            }

            return name;
        }
    }

    private class EmailFunc extends Func {
        public EmailFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            Integer length = (Integer)R.defaultTo.run(null, data.get('length'));
            String domain = (String)R.defaultTo.run(
                Random.anyDomain.run(),
                data.get('domain')
            );

            return (String)Random.anyWord.run(new Map<String, Object>{ 'length' => length }) +
                '@' + domain;
        }
    }

    private class DomainFunc extends Func {
        public DomainFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            String tld = R.of(TLDS).sample().toString();

            return (String)Random.anyWord.run() + '.' + tld;
        }
    }

    private class SObjectFunc extends Func {
        public SObjectFunc() {
            super(-1);
        }

        public override Object exec() {
            return this.exec(null);
        }

        public override Object exec(Object arg) {
            Map<String, Object> data = (Map<String, Object>)R.toMap.run(arg);

            String type = (String)R.defaultTo.run(null, data.get('type'));
            Boolean cascade = (Boolean)R.defaultTo.run(false, data.get('cascade'));

            List<String> requestedFields = null;
            Map<String, Func> fields = null;

            Object fieldsVal = data.get('fields');
            if((Boolean)R.isListLike.run(fieldsVal)) {
                requestedFields = (List<String>)R.toStringList.run(fieldsVal);
            }
            else if((Boolean)R.isMapLike.run(fieldsVal)) {
                fields = new Map<String, Func>();
                Map<String, Object> fieldMap = (Map<String, Object>)R.toMap.run(fieldsVal);
                for(String key : fieldMap.keySet()) {
                    Object value = fieldMap.get(key);
                    if(value instanceof Func) {
                        fields.put(key, (Func)value);
                    }
                    else {
                        fields.put(key, (Func)R.always.run(value));
                    }
                }
            }

            if(type == null) {
                throw new RandomException('SObject type is not provided');
            }

            Schema.sObjectType token = GLOBAL_DESCRIBE.get(type);
            if (token == null) {
                throw new RandomException('Unsupported SObject type: ' + type);
            }

            SObject obj = token.newSObject();

            for (Schema.SObjectField field : getFieldMap(type).values()) {
                String fieldName = field.getDescribe().getName();

                setFieldValue(obj, field, cascade, requestedFields);

                if(fields != null && fields.containsKey(fieldName)) {
                    Func valFunc = fields.get(fieldName);
                    Object val = valFunc.run();
                    obj.put(field, val);
                }
            }

            return obj;
        }
    }

    public class RandomException extends Exception {
    }
}
