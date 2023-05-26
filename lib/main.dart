import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:pie_chart/pie_chart.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: WelcomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFCAFFDC),
                  Color(0xFFCAFFDC),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: Image.asset(
                    'assets/images/app_logo.png',
                    width: 160,
                    height: 160,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'BUDGETKU',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF58906E),
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Manage your money with ease',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF58906E),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: Center(
                      child: Text(
                        'GET STARTED',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF58906E),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width:
          double.infinity, // Set the width to fill the entire available space
      height:
          double.infinity, // Set the height to fill the entire available space
      color:
          const Color(0xFFFF), // Set the background color for the entire screen
      child: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Welcome !', // Welcome! - text
                style: TextStyle(
                  fontSize: 40,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 27), // Add spacing
              const Text(
                'Log in to', // Log in to - text
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8), // Add spacing
              const Text(
                'BUDGETKU is simply', // BUDGETKU is simply - text
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 16), // Add spacing
              Text(
                'Username', // Username - text
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8), // Add spacing
              TextFormField(
                // Insert text box below
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your username',
                ),
              ),
              const SizedBox(height: 16), // Add spacing
              Text(
                'Password', // Password - text
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10), // Add spacing
              TextFormField(
                // Insert text box below, note: text can be hidden
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(height: 10), // Add spacing
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ), // Add check box, Remember Me - text
                  const Text('Remember Me'),
                  const Spacer(), // Add spacing
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Color(0xFF58906E), //<-- SEE HERE
                    ),
                    onPressed: () {
                      // Forgot Password? - text only
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Add spacing
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF58906E), //<-- SEE HERE
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyPage()),
                    );
                  },
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 16), // Add spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Color(0xFF58906E), //<-- SEE HERE
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    ));
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double
                .infinity, // Set the width to fill the entire available space
            height: double
                .infinity, // Set the height to fill the entire available space
            color: Color.fromARGB(255, 253, 253,
                253), // Set the background color for the entire screen
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Welcome !', // Welcome! - text
                        style: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 8), // Add spacing
                      const Text(
                        'Sign up to', // Sign up to - text
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10), // Add spacing
                      const Text(
                        'BUDGETKU is simply', // BUDGETKU is simply - text
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 25), // Add spacing
                      Text(
                        'Email', // Email - text
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8), // Add spacing
                      TextFormField(
                        // Insert text box below
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your email',
                        ),
                      ),
                      const SizedBox(height: 16), // Add spacing
                      Text(
                        'Username', // Username - text
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8), // Add spacing
                      TextFormField(
                        // Insert text box below
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your username',
                        ),
                      ),
                      const SizedBox(height: 16), // Add spacing
                      Text(
                        'Password', // Password - text
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8), // Add spacing
                      TextFormField(
                        // Insert text box below, note: text can be hidden
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your password',
                        ),
                      ),
                      const SizedBox(height: 16), // Add spacing
                      Text(
                        'Confirm Password', // Confirm Password - text
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8), // Add spacing
                      TextFormField(
                        // Insert text box below, note: text can be hidden
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Confirm your password',
                        ),
                      ),
                      const SizedBox(height: 16), // Add spacing
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF58906E), //<-- SEE HERE
                          ),
                          onPressed: () {
                            // Register Button (center)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyPage()),
                            );
                          },
                          child: const Text('Register'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MyProfile(),
    MyExpensePage(),
    MySpendingPage(),
    GroceriesCalculatorPage(),
    MyDebtPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: const Color(0xFFCAFFDC), // Set the background color
          child: _pages[_currentIndex],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color(
                0xFF58906E), // Set the background color of the BottomNavigationBar
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'My Page',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.graphic_eq),
                label: 'My Expense',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit),
                label: 'My Spending',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Groceries',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money),
                label: 'My Debt',
              ),
            ],
          ),
        ));
  }
}

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool alarmOn = false;
  Color alarmColor = Colors.grey;
  bool showProfileFields = false; // Flag to control visibility

  final List<User> userList = [
    User('Jessica', 'jessicainseoul@gmail.com', 'jessica1',
        AssetImage('assets/images/jessica.png')),
    User('Johny', 'johnyfriends@gmail.com', 'johny2',
        AssetImage('assets/images/johny.png')),
    User('Max', 'maxfarmer@gmail.com', 'max3',
        AssetImage('assets/images/max.png')),
  ];

  @override
  Widget build(BuildContext context) {
    final userNow = userList[2];
    return Scaffold(
        body: Container(
            width: double
                .infinity, // Set the width to fill the entire available space
            height: double
                .infinity, // Set the height to fill the entire available space
            color: Color.fromARGB(255, 247, 251, 248),
            //const Color(0xFFCAFFDC), // Set the background color for the entire screen
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Center(
                        child: Text(
                          'My Page',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B5E20),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        height: 1,
                        color: Color(0xFF1B5E20),
                      ),
                      const SizedBox(height: 16), // Add spacing

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius:
                                50, // Adjust the radius to control the size of the circular image
                            backgroundImage: userNow
                                .icon, // Replace with your image asset path
                          ),
                          SizedBox(
                              width:
                                  20), // Add some spacing between the icon and text
                          Text(
                            //userName
                            userNow.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12), // Add spacing
                      Center(
                        child: Text(
                          //displayed email
                          userNow.email,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16), // Add spacing
                      InkWell(
                        onTap: () {
                          setState(() {
                            showProfileFields =
                                !showProfileFields; // Toggle visibility
                          });
                        },
                        child: const Text(
                          'Edit profile',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: showProfileFields, // Control visibility
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Username', // Username - text
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8), // Add spacing
                            TextFormField(
                              // Insert text box below
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your new username',
                              ),
                            ),
                            const SizedBox(height: 16), // Add spacing
                            Text(
                              'Password', // Password - text
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8), // Add spacing
                            TextFormField(
                              // Insert text box below, note: text can be hidden
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your new password',
                              ),
                            ),
                            const SizedBox(height: 16), // Add spacing
                            Text(
                              'Confirm Password', // Confirm Password - text
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8), // Add spacing
                            TextFormField(
                              // Insert text box below, note: text can be hidden
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Confirm your password',
                              ),
                            ),
                            const SizedBox(height: 16), // Add spacing
                            const Text(
                              'Email', // Email - text
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8), // Add spacing
                            TextFormField(
                              // Insert text box below
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your new email',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16), // Add spacing
                      Row(
                        children: [
                          Text(
                            'Push Notifications',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              width:
                                  100), // Add some spacing between the icon and text
                          InkWell(
                            child: Icon(
                              alarmOn ? Icons.toggle_on : Icons.toggle_off,
                              size: 50,
                              color: alarmColor,
                            ),
                            onTap: () {
                              setState(() {
                                alarmOn = !alarmOn;
                                alarmColor = alarmColor == Colors.black
                                    ? Colors.grey
                                    : Colors.black;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}

class User {
  final String name;
  final String email;
  final String password;
  final AssetImage icon;

  User(this.name, this.email, this.password, this.icon);
}

class MyExpensePage extends StatefulWidget {
  const MyExpensePage({Key? key}) : super(key: key);

  @override
  _MyExpensePageState createState() => _MyExpensePageState();
}

class _MyExpensePageState extends State<MyExpensePage> {
  String dropdownValue = 'January'; // Default dropdown value
  final Map<String, Map<String, double>> expenseData = {
    'January': {
      'Rent': 750000,
      'Utilities': 150000,
      'Transportation': 100000,
      'Food': 400000,
      'Entertainment': 80000,
    },
    'February': {
      'Rent': 720000,
      'Utilities': 140000,
      'Transportation': 100000,
      'Food': 380000,
      'Entertainment': 90000,
    },
    'March': {
      'Rent': 750000,
      'Utilities': 160000,
      'Transportation': 100000,
      'Food': 420000,
      'Entertainment': 95000,
    },
    'April': {
      'Rent': 700000,
      'Utilities': 140000,
      'Transportation': 95000,
      'Food': 380000,
      'Entertainment': 85000,
    },
    'May': {
      'Rent': 730000,
      'Utilities': 150000,
      'Transportation': 105000,
      'Food': 400000,
      'Entertainment': 90000,
    },
    'June': {
      'Rent': 720000,
      'Utilities': 140000,
      'Transportation': 100000,
      'Food': 390000,
      'Entertainment': 85000,
    },
    'July': {
      'Rent': 750000,
      'Utilities': 160000,
      'Transportation': 105000,
      'Food': 420000,
      'Entertainment': 95000,
    },
    'August': {
      'Rent': 700000,
      'Utilities': 140000,
      'Transportation': 95000,
      'Food': 380000,
      'Entertainment': 85000,
    },
    'September': {
      'Rent': 730000,
      'Utilities': 150000,
      'Transportation': 105000,
      'Food': 400000,
      'Entertainment': 90000,
    },
    'October': {
      'Rent': 720000,
      'Utilities': 140000,
      'Transportation': 100000,
      'Food': 390000,
      'Entertainment': 85000,
    },
    'November': {
      'Rent': 750000,
      'Utilities': 160000,
      'Transportation': 105000,
      'Food': 420000,
      'Entertainment': 95000,
    },
    'December': {
      'Rent': 700000,
      'Utilities': 140000,
      'Transportation': 95000,
      'Food': 380000,
      'Entertainment': 85000,
    },
  };

  double calculateTotalExpense(String chosenMonth) {
    double totalExpense = 0;

    final Map<String, double> expenses = expenseData[chosenMonth] ?? {};
    expenses.forEach((category, expense) {
      totalExpense += expense;
    });

    return totalExpense;
  }

  final legendLabels = <String, String>{
    "Rent": "Rent legend",
    "Utilities": "Utilities legend",
    "Transportation": "Transportation legend",
    "Food": "Food legend",
    "Entertainment": "Entertainment legend",
  };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(223, 250, 92, 1),
      const Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      const Color.fromRGBO(129, 182, 205, 1),
      const Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      const Color.fromRGBO(175, 63, 62, 1.0),
      const Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      dataMap: expenseData[dropdownValue] ?? {},
      animationDuration: const Duration(milliseconds: 800),
      chartRadius: min(MediaQuery.of(context).size.width / 1.5, 500),
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.disc,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      emptyColor: Colors.grey[300]!,
      baseChartColor: Colors.transparent,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFCAFFDC), // Set the background color here
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$dropdownValue\'s Expense',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    items: <String>[
                      'January',
                      'February',
                      'March',
                      'April',
                      'May',
                      'June',
                      'July',
                      'August',
                      'September',
                      'October',
                      'November',
                      'December',
                    ].map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        // Call a function to generate random table rows or perform any other action
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 32,
              ),
              child: Column(
                children: [
                  Text(
                    '${NumberFormat('#,##0').format(calculateTotalExpense(dropdownValue).toInt())}₩',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  chart,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MySpendingPage extends StatefulWidget {
  const MySpendingPage({super.key});
  @override
  _MySpendingPageState createState() => _MySpendingPageState();
}

class _MySpendingPageState extends State<MySpendingPage> {
  String dropdownValue = 'January';
  double totalSpend = 0;
  double budget = 1000000;
  Months thisMonth = jan;
  List<TableRow> tableRows = [];
  final Random random = Random();
  final TextEditingController _budgetController = TextEditingController();
  String getMonthNumber(String month) {
    switch (month) {
      case 'January':
        return '01';
      case 'February':
        return '02';
      case 'March':
        return '03';
      case 'April':
        return '04';
      case 'May':
        return '05';
      case 'June':
        return '06';
      case 'July':
        return '07';
      case 'August':
        return '08';
      case 'September':
        return '09';
      case 'October':
        return '10';
      case 'November':
        return '11';
      case 'December':
        return '12';
      default:
        return '01'; // Default to January if the month is not recognized
    }
  }

  String getFormattedDate(String month) {
    int monthNumber = int.parse(getMonthNumber(month));
    String formattedMonth = monthNumber.toString().padLeft(2, '0');
    DateTime now = DateTime.now();
    return '${now.day}/$formattedMonth/${now.year}';
  }

  void generateRandomTableRows() {
    tableRows.clear();
    //Months thisMonth = may;
    totalSpend = 0;
    Months selectedMonth(String month) {
      switch (month) {
        case 'January':
          return jan;
        case 'February':
          return feb;
        case 'March':
          return mar;
        case 'April':
          return april;
        case 'May':
          return may;
        case 'June':
          return june;
        case 'July':
          return july;
        case 'August':
          return aug;
        case 'September':
          return sept;
        case 'October':
          return oct;
        case 'November':
          return nov;
        case 'December':
          return dec;
        default:
          return jan; // Default to January if the month is not recognized
      }
    }

    thisMonth = selectedMonth(dropdownValue);
    budget = double.parse(thisMonth.monthBudget);
    List<Spending> spendRec = thisMonth.spendList;

    int rowCount = spendRec.length; // Random number of rows between 1 and 6

    for (int i = 0; i < rowCount; i++) {
      String title = spendRec[i].name;
      //String month = getMonthNumber(dropdownValue);
      String month = spendRec[i].date.month.toString();
      String day = spendRec[i].date.day.toString();
      String date = '$day/$month/2023';
      String category = spendRec[i].category;
      double amountNo = spendRec[i].amount;
      totalSpend += amountNo;
      String amount = amountNo.toStringAsFixed(0).replaceAll('.', '');

      TableRow newRow = TableRow(
        children: [
          Column(
            children: [
              Text(
                date,
                textScaleFactor: 1.2,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                title,
                //textScaleFactor: 1.3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 4),
              Text(
                category,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 21, 32, 159),
                ),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '(-$amount KRW)',
                textScaleFactor: 1.3,
                style: TextStyle(
                  color: Colors.red,
                  //color: amount.startsWith('-') ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          // SizedBox(width: 10,),
          // Icon(Icons.edit)
        ],
      );

      tableRows.add(newRow);
    }
  }

  @override
  void initState() {
    super.initState();
    generateRandomTableRows();
  }

  void onTapText() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Budget'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _budgetController,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  String newBudgetText = _budgetController.text;
                  double newBudget = double.tryParse(newBudgetText) ?? 0.0;
                  budget = newBudget;
                  //budget=double.parse(thisMonth.monthBudget);
                  thisMonth.monthBudget = newBudgetText;
                  _budgetController.clear();

                  Navigator.pop(context);
                });
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  double allTotal = 0;

  @override
  Widget build(BuildContext context) {
    double remaining = budget - totalSpend;
    double progress =
        (remaining / budget).clamp(0.0, 1.0); // Calculate progress value
    return Scaffold(
        body: Container(
            width: double
                .infinity, // Set the width to fill the entire available space
            height: double
                .infinity, // Set the height to fill the entire available space
            color: Color.fromARGB(255, 247, 251,
                248), // Set the background color for the entire screen
            child: SingleChildScrollView(
                child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  // component of the page
                  children: [
                    SizedBox(height: 50),
                    Center(
                      child: Text(
                        'My Spending',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B5E20),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      height: 1,
                      color: Color(0xFF1B5E20),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        'Month:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        items: <String>[
                          'January',
                          'February',
                          'March',
                          'April',
                          'May',
                          'June',
                          'July',
                          'August',
                          'September',
                          'October',
                          'November',
                          'December',
                        ].map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                            generateRandomTableRows();
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Budget: ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: onTapText,
                            child: Text(
                              budget.toString(),
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        minHeight: 10,
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Remainder: ₩ ${remaining.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ...tableRows.map((row) => Row(children: row.children)),
                    SizedBox(height: 10),
                    Divider(
                      height: 1,
                      color: Color(0xFF1B5E20),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total Spending:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '₩ ${totalSpend.toStringAsFixed(0)}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              onPressed: () async {
                                TextEditingController titleController =
                                    TextEditingController();
                                TextEditingController amountController =
                                    TextEditingController();

                                TextEditingController categoryController =
                                    TextEditingController();

                                await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Add New Spending Record'),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller: titleController,
                                              decoration: InputDecoration(
                                                labelText: 'Title',
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            SizedBox(height: 16),
                                            TextField(
                                              controller: amountController,
                                              decoration: InputDecoration(
                                                labelText: 'Amount',
                                              ),
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(
                                                        r'^-?\d*\.?\d*')),
                                              ],
                                            ),
                                            SizedBox(height: 16),
                                            TextField(
                                              controller: categoryController,
                                              decoration: InputDecoration(
                                                labelText: 'Category',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              String title =
                                                  titleController.text;
                                              String amount =
                                                  amountController.text;
                                              String category =
                                                  categoryController.text;

                                              amount = '(-$amount';
                                              String formattedDate =
                                                  getFormattedDate(
                                                      dropdownValue);

                                              TableRow newRow = TableRow(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        formattedDate,
                                                        textScaleFactor: 1.2,
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        title,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                      SizedBox(height: 4),
                                                      Text(
                                                        category,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Color.fromARGB(
                                                              255, 21, 32, 159),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        '$amount KRW)',
                                                        textScaleFactor: 1.3,
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // SizedBox(width: 10),
                                                  // Icon(Icons.edit)
                                                ],
                                              );

                                              tableRows.add(newRow);

                                              titleController.clear();
                                              amountController.clear();
                                              categoryController.clear();

                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text('Add'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                '+',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ], //end of component page
                ),
              ),
            ))));
  }
}

class Months {
  final String monthName;
  String monthBudget;
  final List<Spending> spendList;

  Months(
    this.monthName,
    this.monthBudget,
    this.spendList,
  );
}

class Spending {
  final DateTime date;
  final String name;
  final String category;
  final double amount;

  Spending(this.date, this.name, this.category, this.amount);
}


class GroceriesCalculatorPage extends StatefulWidget {
  const GroceriesCalculatorPage({super.key});
  @override
  _GroceriesCalculatorPageState createState() =>
      _GroceriesCalculatorPageState();
}

class _GroceriesCalculatorPageState extends State<GroceriesCalculatorPage> {
  double budget = 0.0;
  List<Map<String, dynamic>> groceryList = [];
  final TextEditingController _budgetController = TextEditingController();

  void addItem(BuildContext context) async {
    final result = await showDialog<Map<String, dynamic>?>(
      context: context,
      builder: (BuildContext context) => AddItemDialog(),
    );

    if (result != null &&
        result.containsKey('item') &&
        result.containsKey('price')) {
      setState(() {
        groceryList.add({
          'item': result['item'],
          'price': result['price'],
        });
      });
    }
  }

  double getTotalCost() {
    double total = 0.0;
    for (var item in groceryList) {
      total += item['price'] as double;
    }
    return total;
  }

  double getRemainingBudget() {
    return budget - getTotalCost();
  }

  void resetCalculator() {
    setState(() {
      budget = 0.0;
      groceryList.clear();
      _budgetController.text = ''; // Clear the text field
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAFFDC),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0), // Add space here
              Center(
                child: Text(
                  'Grocery Calculator',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text('Today\'s Budget: ${NumberFormat('#,###').format(budget)}₩'),
              TextField(
                controller: _budgetController,
                onChanged: (value) {
                  setState(() {
                    budget = double.tryParse(value.replaceAll(',', '')) ?? 0.0;
                  });
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Today\'s Budget',
                  suffixText: '₩',
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grocery List:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () => addItem(context),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF58906E),
                    ),
                    child: const Text('Add Item'),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (int index = 0; index < groceryList.length; index++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          '${index + 1}. ${groceryList[index]['item']} ${NumberFormat('#,###').format(groceryList[index]['price'].toInt())}₩',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Total Cost: ${NumberFormat('#,###').format(getTotalCost().toInt())}₩',
              ),
              const SizedBox(height: 16.0),
              Text(
                'Remaining Budget: ${NumberFormat('#,###').format(getRemainingBudget().toInt())}₩',
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: resetCalculator,
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF58906E),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.refresh),
                    const SizedBox(width: 8.0),
                    const Text('Reset'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddItemDialog extends StatefulWidget {
  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final _formKey = GlobalKey<FormState>();
  String _item = '';
  double _price = 0.0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Item'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Item'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an item';
                }
                return null;
              },
              onSaved: (value) {
                _item = value ?? '';
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Price',
                suffixText: '₩',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a price';
                }
                final price = double.tryParse(value);
                if (price == null || price <= 0.0) {
                  return 'Please enter a valid price';
                }
                return null;
              },
              onSaved: (value) {
                _price = double.parse(value ?? '0.0');
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              _formKey.currentState?.save();
              Navigator.of(context).pop({'item': _item, 'price': _price});
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}

class MyDebtPage extends StatefulWidget {
  const MyDebtPage({Key? key}) : super(key: key);

  @override
  _MyDebtPageState createState() => _MyDebtPageState();
}

class _MyDebtPageState extends State<MyDebtPage> {
  String dropdownValue = 'January';
  List<TableRow> tableRows = [];
  List<TableRow> paidTableRows = [];
  List<TableRow> nonPaidTableRows = [];
  final Random random = Random();

  String getMonthNumber(String month) {
    switch (month) {
      case 'January':
        return '01';
      case 'February':
        return '02';
      case 'March':
        return '03';
      case 'April':
        return '04';
      case 'May':
        return '05';
      case 'June':
        return '06';
      case 'July':
        return '07';
      case 'August':
        return '08';
      case 'September':
        return '09';
      case 'October':
        return '10';
      case 'November':
        return '11';
      case 'December':
        return '12';
      default:
        return '01'; // Default to January if the month is not recognized
    }
  }

  String getFormattedDate(String month) {
    int monthNumber = int.parse(getMonthNumber(month));
    String formattedMonth = monthNumber.toString().padLeft(2, '0');
    DateTime now = DateTime.now();
    return '${now.day}/$formattedMonth/${now.year}';
  }

  void generateRandomTableRows() {
    tableRows.clear();
    paidTableRows.clear();
    nonPaidTableRows.clear();

    int rowCount =
        random.nextInt(6) + 1; // Random number of rows between 1 and 6
    final List<int> amountList = [1000, 15000, 25000, 5000, 8000, 100000];
    final List<int> totalAmountList = [50000, 100000, 200000, 300000, 50000];
    final List<String> personList = [
      'Wani',
      'Jennie',
      'Miyeon',
      'Yeran',
      'Adlan',
      'Jani',
      'Emily',
      'Lee',
      'Hong'
    ];
    final List<String> titleList = [
      'Mcdonald',
      'Travel',
      'Event',
      'Drink',
      'Travel',
      'Dayout',
      'Party',
      'Cafe',
      'Lunch',
      'Dinner'
    ];

    for (int i = 0; i < rowCount; i++) {
      String title = titleList[random.nextInt(titleList.length)];
      String month = getMonthNumber(dropdownValue);
      String day = (random.nextInt(30) + 1).toString().padLeft(2, '0');
      String date = '$day/$month/2023';
      String amount =
          (amountList[random.nextInt(amountList.length)] - 9000).toString();
      String totalAmount =
          (totalAmountList[random.nextInt(totalAmountList.length)] - 100)
              .toString();
      String person = personList[random.nextInt(personList.length)];

      TableRow newRow = TableRow(
        children: [
          Column(
            children: [
              Text(
                title,
                textScaleFactor: 1.5,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                '($amount KRW)',
                textScaleFactor: 1.3,
                style: TextStyle(
                  color: amount.startsWith('-') ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                '$totalAmount KRW',
                textScaleFactor: 1.5,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 4),
              Text(
                person,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      );

      tableRows.add(newRow);

      int paidRowCount = random.nextInt(tableRows.length);
      int nonPaidRowCount = tableRows.length - paidRowCount;

      paidTableRows = List.generate(
          paidRowCount, (index) => tableRows[random.nextInt(tableRows.length)]);
      nonPaidTableRows =
          tableRows.where((row) => !paidTableRows.contains(row)).toList();
    }
  }

  void settleDebt(int index) {
    setState(() {
      TableRow settledRow = nonPaidTableRows[index];
      nonPaidTableRows.removeAt(index);
      paidTableRows.add(settledRow);
    });
  }

  @override
  void initState() {
    super.initState();
    generateRandomTableRows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 247, 251, 248)!,
              Color.fromARGB(255, 247, 250, 248)!
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: 40),
              Center(
                child: Text(
                  'My Debt Page',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$dropdownValue\'s Debt Record',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      items: <String>[
                        'January',
                        'February',
                        'March',
                        'April',
                        'May',
                        'June',
                        'July',
                        'August',
                        'September',
                        'October',
                        'November',
                        'December',
                      ].map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                          generateRandomTableRows();
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.green),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Record',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 16),
                        ...tableRows.map((row) => Row(children: row.children)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              if (paidTableRows.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.green),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Settled',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 16),
                          ...paidTableRows
                              .map((row) => Row(children: row.children)),
                        ],
                      ),
                    ),
                  ),
                ),
              if (nonPaidTableRows.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.green),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Non-Settled',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 16),
                          ...nonPaidTableRows.asMap().entries.map(
                            (entry) {
                              int index = entry.key;
                              TableRow row = entry.value;
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Let\'s confirm first! ^^'),
                                        content: Text('Have you settled it?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('No'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              settleDebt(index);
                                              Navigator.pop(context);
                                            },
                                            child: Text('Yes'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Row(children: row.children),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () async {
                    TextEditingController titleController =
                        TextEditingController();
                    TextEditingController amountController =
                        TextEditingController();
                    TextEditingController totalAmountController =
                        TextEditingController();
                    TextEditingController personController =
                        TextEditingController();
                    String selectedSign = '+';

                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Add New Debt Record'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: titleController,
                                  decoration: InputDecoration(
                                    labelText: 'Title',
                                  ),
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    DropdownButton<String>(
                                      value: selectedSign,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedSign = value!;
                                        });
                                      },
                                      items: <DropdownMenuItem<String>>[
                                        DropdownMenuItem<String>(
                                          value: '+',
                                          child: Text(
                                            '+',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 24),
                                          ),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: '-',
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 24),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                TextField(
                                  controller: amountController,
                                  decoration: InputDecoration(
                                    labelText: 'Amount',
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^-?\d*\.?\d*')),
                                  ],
                                ),
                                SizedBox(height: 16),
                                TextField(
                                  controller: totalAmountController,
                                  decoration: InputDecoration(
                                    labelText: 'Total Amount',
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextField(
                                  controller: personController,
                                  decoration: InputDecoration(
                                    labelText: 'Person',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  String title = titleController.text;
                                  String amount = amountController.text;
                                  String totalAmount =
                                      totalAmountController.text;
                                  String person = personController.text;

                                  amount = selectedSign == '+'
                                      ? '(+$amount'
                                      : '(-$amount';
                                  String formattedDate =
                                      getFormattedDate(dropdownValue);

                                  TableRow newRow = TableRow(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            title,
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            formattedDate,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            '$amount KRW)',
                                            textScaleFactor: 1.3,
                                            style: TextStyle(
                                              color: selectedSign == '+'
                                                  ? Colors.green
                                                  : Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '$totalAmount KRW',
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            person,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );

                                  tableRows.add(newRow);
                                  nonPaidTableRows.add(newRow);

                                  titleController.clear();
                                  amountController.clear();
                                  totalAmountController.clear();
                                  personController.clear();

                                  Navigator.pop(context);
                                });
                              },
                              child: Text('Add'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

Months jan = Months("January", "640000", [
  Spending(DateTime(2023, 1, 10), "House", "Rent", 360000),
  Spending(DateTime(2023, 1, 8), "Heater", "Utilities", 81000),
  Spending(DateTime(2023, 1, 7), "Bicycle", "Rent", 7400),
  Spending(DateTime(2023, 1, 19), "Water", "Utilities", 2300),
  Spending(DateTime(2023, 1, 25), "Train", "Transportation", 8500),
  Spending(DateTime(2023, 1, 13), "Cuckoo", "Rent", 7800),
  Spending(DateTime(2023, 1, 1), "Playdoh", "Entertainment", 4500),
  Spending(DateTime(2023, 1, 25), "Kebab", "Food", 1300),
  Spending(DateTime(2023, 1, 12), "Coffee", "Food", 1300),
  Spending(DateTime(2023, 1, 1), "RoyalIndian", "Food", 8100),
]);

Months feb = Months("February", "640000", [
  Spending(DateTime(2023, 2, 27), "Expense 1", "Food", 7800),
  Spending(DateTime(2023, 2, 16), "Expense 2", "Entertainment", 3500),
  Spending(DateTime(2023, 2, 26), "Expense 3", "Transportation", 2600),
  Spending(DateTime(2023, 2, 10), "Expense 4", "Utilities", 9600),
  Spending(DateTime(2023, 2, 24), "Expense 5", "Rent", 9600),
  Spending(DateTime(2023, 2, 14), "Expense 6", "Entertainment", 8300),
  Spending(DateTime(2023, 2, 15), "Expense 7", "Rent", 9100),
  Spending(DateTime(2023, 2, 22), "Expense 8", "Transportation", 9300),
  Spending(DateTime(2023, 2, 16), "Expense 9", "Rent", 3500),
  Spending(DateTime(2023, 2, 24), "Expense 10", "Transportation", 9600),
]);

Months mar = Months("March", "640000", [
  Spending(DateTime(2023, 3, 25), "Expense 1", "Rent", 9300),
  Spending(DateTime(2023, 3, 3), "Expense 2", "Rent", 3600),
  Spending(DateTime(2023, 3, 5), "Expense 3", "Utilities", 7500),
  Spending(DateTime(2023, 3, 16), "Expense 4", "Rent", 6100),
  Spending(DateTime(2023, 3, 10), "Expense 5", "Transportation", 7600),
  Spending(DateTime(2023, 3, 10), "Expense 6", "Entertainment", 8600),
  Spending(DateTime(2023, 3, 25), "Expense 7", "Utilities", 8800),
  Spending(DateTime(2023, 3, 8), "Expense 8", "Rent", 9600),
  Spending(DateTime(2023, 3, 10), "Expense 9", "Utilities", 8900),
  Spending(DateTime(2023, 3, 15), "Expense 10", "Food", 3100),
]);

Months april = Months("April", "640000", [
  Spending(DateTime(2023, 4, 18), "Expense 1", "Utilities", 3700),
  Spending(DateTime(2023, 4, 15), "Expense 2", "Food", 6200),
  Spending(DateTime(2023, 4, 27), "Expense 3", "Transportation", 6600),
  Spending(DateTime(2023, 4, 21), "Expense 4", "Entertainment", 3600),
  Spending(DateTime(2023, 4, 12), "Expense 5", "Entertainment", 4400),
  Spending(DateTime(2023, 4, 12), "Expense 6", "Rent", 8400),
  Spending(DateTime(2023, 4, 21), "Expense 7", "Transportation", 2600),
  Spending(DateTime(2023, 4, 5), "Expense 8", "Rent", 6700),
  Spending(DateTime(2023, 4, 9), "Expense 9", "Food", 3600),
  Spending(DateTime(2023, 4, 19), "Expense 10", "Rent", 8800),
]);

Months may = Months("May", "640000", [
  Spending(DateTime(2023, 5, 28), "Expense 1", "Food", 3800),
  Spending(DateTime(2023, 5, 27), "Expense 2", "Rent", 800),
  Spending(DateTime(2023, 5, 23), "Expense 3", "Food", 4200),
  Spending(DateTime(2023, 5, 5), "Expense 4", "Transportation", 1900),
  Spending(DateTime(2023, 5, 15), "Expense 5", "Rent", 6200),
  Spending(DateTime(2023, 5, 5), "Expense 6", "Entertainment", 4300),
  Spending(DateTime(2023, 5, 19), "Expense 7", "Utilities", 9300),
  Spending(DateTime(2023, 5, 13), "Expense 8", "Rent", 1200),
  Spending(DateTime(2023, 5, 10), "Expense 9", "Rent", 200),
  Spending(DateTime(2023, 5, 24), "Expense 10", "Utilities", 8700),
]);

Months june = Months("June", "640000", [
  Spending(DateTime(2023, 6, 7), "Expense 1", "Utilities", 9000),
  Spending(DateTime(2023, 6, 15), "Expense 2", "Entertainment", 9500),
  Spending(DateTime(2023, 6, 5), "Expense 3", "Food", 3700),
  Spending(DateTime(2023, 6, 5), "Expense 4", "Rent", 1300),
  Spending(DateTime(2023, 6, 18), "Expense 5", "Rent", 3500),
  Spending(DateTime(2023, 6, 15), "Expense 6", "Utilities", 2800),
  Spending(DateTime(2023, 6, 19), "Expense 7", "Food", 800),
  Spending(DateTime(2023, 6, 7), "Expense 8", "Food", 7100),
  Spending(DateTime(2023, 6, 9), "Expense 9", "Transportation", 4700),
  Spending(DateTime(2023, 6, 8), "Expense 10", "Food", 8100),
]);

Months july = Months("July", "640000", [
  Spending(DateTime(2023, 7, 9), "Expense 1", "Rent", 8500),
  Spending(DateTime(2023, 7, 19), "Expense 2", "Entertainment", 900),
  Spending(DateTime(2023, 7, 22), "Expense 3", "Transportation", 6800),
  Spending(DateTime(2023, 7, 12), "Expense 4", "Utilities", 2300),
  Spending(DateTime(2023, 7, 16), "Expense 5", "Food", 200),
  Spending(DateTime(2023, 7, 19), "Expense 6", "Entertainment", 8000),
  Spending(DateTime(2023, 7, 25), "Expense 7", "Entertainment", 2900),
  Spending(DateTime(2023, 7, 28), "Expense 8", "Transportation", 5300),
  Spending(DateTime(2023, 7, 9), "Expense 9", "Entertainment", 2700),
  Spending(DateTime(2023, 7, 9), "Expense 10", "Utilities", 8100),
]);

Months aug = Months("August", "640000", [
  Spending(DateTime(2023, 8, 17), "Expense 1", "Transportation", 3400),
  Spending(DateTime(2023, 8, 2), "Expense 2", "Transportation", 2800),
  Spending(DateTime(2023, 8, 4), "Expense 3", "Utilities", 3700),
  Spending(DateTime(2023, 8, 22), "Expense 4", "Transportation", 1700),
  Spending(DateTime(2023, 8, 19), "Expense 5", "Rent", 100),
  Spending(DateTime(2023, 8, 7), "Expense 6", "Food", 4300),
  Spending(DateTime(2023, 8, 8), "Expense 7", "Rent", 5400),
  Spending(DateTime(2023, 8, 14), "Expense 8", "Transportation", 700),
  Spending(DateTime(2023, 8, 28), "Expense 9", "Entertainment", 2600),
  Spending(DateTime(2023, 8, 11), "Expense 10", "Rent", 6300),
]);

Months sept = Months("September", "640000", [
  Spending(DateTime(2023, 9, 24), "Expense 1", "Utilities", 2100),
  Spending(DateTime(2023, 9, 27), "Expense 2", "Utilities", 7100),
  Spending(DateTime(2023, 9, 3), "Expense 3", "Utilities", 4400),
  Spending(DateTime(2023, 9, 14), "Expense 4", "Utilities", 3700),
  Spending(DateTime(2023, 9, 4), "Expense 5", "Transportation", 8300),
  Spending(DateTime(2023, 9, 16), "Expense 6", "Transportation", 6600),
  Spending(DateTime(2023, 9, 2), "Expense 7", "Transportation", 2900),
  Spending(DateTime(2023, 9, 18), "Expense 8", "Entertainment", 7800),
  Spending(DateTime(2023, 9, 4), "Expense 9", "Transportation", 5600),
  Spending(DateTime(2023, 9, 13), "Expense 10", "Rent", 2200),
]);

Months oct = Months("October", "640000", [
  Spending(DateTime(2023, 10, 22), "Expense 1", "Transportation", 2900),
  Spending(DateTime(2023, 10, 13), "Expense 2", "Rent", 5800),
  Spending(DateTime(2023, 10, 3), "Expense 3", "Entertainment", 4400),
  Spending(DateTime(2023, 10, 15), "Expense 4", "Transportation", 3300),
  Spending(DateTime(2023, 10, 4), "Expense 5", "Transportation", 9000),
  Spending(DateTime(2023, 10, 3), "Expense 6", "Food", 5400),
  Spending(DateTime(2023, 10, 11), "Expense 7", "Utilities", 1500),
  Spending(DateTime(2023, 10, 25), "Expense 8", "Rent", 4100),
  Spending(DateTime(2023, 10, 23), "Expense 9", "Food", 7300),
  Spending(DateTime(2023, 10, 7), "Expense 10", "Entertainment", 4500),
]);

Months nov = Months("November", "640000", [
  Spending(DateTime(2023, 11, 2), "Expense 1", "Entertainment", 7600),
  Spending(DateTime(2023, 11, 13), "Expense 2", "Rent", 3100),
  Spending(DateTime(2023, 11, 12), "Expense 3", "Transportation", 2000),
  Spending(DateTime(2023, 11, 7), "Expense 4", "Rent", 9700),
  Spending(DateTime(2023, 11, 1), "Expense 5", "Food", 7200),
  Spending(DateTime(2023, 11, 25), "Expense 6", "Entertainment", 1300),
  Spending(DateTime(2023, 11, 8), "Expense 7", "Transportation", 7800),
  Spending(DateTime(2023, 11, 2), "Expense 8", "Utilities", 7000),
  Spending(DateTime(2023, 11, 26), "Expense 9", "Entertainment", 6400),
  Spending(DateTime(2023, 11, 1), "Expense 10", "Entertainment", 2000),
]);

Months dec = Months("December", "640000", [
  Spending(DateTime(2023, 12, 23), "Expense 1", "Food", 600),
  Spending(DateTime(2023, 12, 8), "Expense 2", "Utilities", 7000),
  Spending(DateTime(2023, 12, 15), "Expense 3", "Rent", 600),
  Spending(DateTime(2023, 12, 16), "Expense 4", "Utilities", 2200),
  Spending(DateTime(2023, 12, 26), "Expense 5", "Utilities", 300),
  Spending(DateTime(2023, 12, 5), "Expense 6", "Food", 1700),
  Spending(DateTime(2023, 12, 23), "Expense 7", "Rent", 8200),
  Spending(DateTime(2023, 12, 2), "Expense 8", "Entertainment", 6000),
  Spending(DateTime(2023, 12, 12), "Expense 9", "Rent", 6800),
  Spending(DateTime(2023, 12, 17), "Expense 10", "Transportation", 7200),
]);
