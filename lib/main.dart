import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: WelcomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFCAFFDC), // Set the background color to #caffdc
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/app_logo.png', // Update to the path of your custom image
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 8), // Add some spacing
              const Text(
                'BUDGETKU', // Add app name under the logo
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8), // Add some spacing
              const Text(
                'Manage money easily and conveniently!', // Add slogan under the app name
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8), // Add some spacing
              InkWell(
                child: Text(
                  'TAP TO CONTINUE', // Show text instead of a button
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color(0xFF58906E), // Set text color to #58906e
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget  {
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
        width: double.infinity, // Set the width to fill the entire available space
        height: double.infinity, // Set the height to fill the entire available space
        color: const Color(0xFFFF), // Set the background color for the entire screen
        child: SingleChildScrollView(
          child:Center(child: Padding(
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
              TextFormField( // Insert text box below
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
              TextFormField( // Insert text box below, note: text can be hidden
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
                    onChanged: (value){
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ), // Add check box, Remember Me - text
                  const Text('Remember Me'),
                  const Spacer(), // Add spacing
                  TextButton(style: TextButton.styleFrom(
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
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ],
          ),
              )
          
        ),
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
        width: double.infinity, // Set the width to fill the entire available space
        height: double.infinity, // Set the height to fill the entire available space
        color: Color.fromARGB(255, 253, 253, 253), // Set the background color for the entire screen
      child:SingleChildScrollView(
        child:Center(child: Padding(
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
              TextFormField( // Insert text box below
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
              TextFormField( // Insert text box below
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
              TextFormField( // Insert text box below, note: text can be hidden
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
              TextFormField( // Insert text box below, note: text can be hidden
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
                      MaterialPageRoute(builder: (context) => const MyPage()),
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
    MySpendingPage(),
    MyExpensePage(),
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
          canvasColor: const Color(0xFF58906E), // Set the background color of the BottomNavigationBar
        ),
        child:BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'My Spending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: 'My Expense',
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
    )
    );
  }
}

class MySpendingPage extends StatelessWidget {
  const MySpendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('My Spending Page'),
      ),
    );
  }
}

class MyExpensePage extends StatelessWidget {
  const MyExpensePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('My Expense Page'),
      ),
    );
  }
}

class GroceriesCalculatorPage extends StatelessWidget {
  const GroceriesCalculatorPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Groceries Calculator Page'),
      ),
    );
  }
}

class MyDebtPage extends StatefulWidget {
  const MyDebtPage({Key? key}) : super(key: key);
  @override
  State<MyDebtPage> createState() => _DropdownDemoState();
  
}
class _DropdownDemoState extends State<MyDebtPage> {
  String dropdownValue = 'January';

  @override
  Widget build(BuildContext context) {
    bool showTable = dropdownValue == 'January';
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 80,
          ),
          Center(
            child: Text('My Debt Page'),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: DropdownButton<String>(
              value: dropdownValue,
              items: <String>[
                'January',
                'February',
                'March',
                'April',
                'Jun',
                'July',
                'August',
                'September',
                'October',
                'November',
                'December'
              ].map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                },
              ).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Selected Value: $dropdownValue',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Table",
                textScaleFactor: 2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Visibility(
            visible: !showTable,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('CarWash',textScaleFactor: 1.5),
                          Text('12/6/2023'),
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "-5,000KRW",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text('25,000 KRW',textScaleFactor: 1.5),
                          Text('Wani'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Shopping',textScaleFactor: 1.5),
                          Text('19/6/2023'),
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "-150,000KRW",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text('500,000 KRW',textScaleFactor: 1.5),
                          Text('Mimmy'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('MacDonald',textScaleFactor: 1.5),
                          Text('30/6/2023'),
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "(+20,000KRW)",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text('33,000 KRW',textScaleFactor: 1.5),
                          Text('Ritzy'),
                        ],
                      ),
                    ],
                  ),
                  
                  
                ],
              ),
            ),
          ),
         Visibility(
            visible: showTable,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Dinner',textScaleFactor: 1.5),
                          Text('12/1/2023'),
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "-5,000KRW",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text('36,000 KRW',textScaleFactor: 1.5),
                          Text('Lisa'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Travel',textScaleFactor: 1.5),
                          Text('19/1/2023'),
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "-100,000KRW",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text('300,000 KRW',textScaleFactor: 1.5),
                          Text('Farid'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Dayout',textScaleFactor: 1.5),
                          Text('21/1/2023'),
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "(+20,000KRW)",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text('40,000 KRW',textScaleFactor: 1.5),
                          Text('Karina'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Jeju Trip',textScaleFactor: 1.5),
                          Text('25/1/2023'),
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "(-15,000KRW)",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text('50,000 KRW',textScaleFactor: 1.5),
                          Text('Max'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Cafe',textScaleFactor: 1.5),
                          Text('27/1/2023'),
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "(+5,000KRW)",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text('15,000 KRW',textScaleFactor: 1.5),
                          Text('Maryy'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF58906E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddDebt()),
                );
              },
              child: const Text('+'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}




class AddDebt extends StatelessWidget {
  const AddDebt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('AddDebt'),
      ),
    );
  }
}

