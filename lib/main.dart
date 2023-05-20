import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: WelcomePage(),
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

class MyDebtPage extends StatelessWidget {
  const MyDebtPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('My Debt Page'),
      ),
    );
  }
}

