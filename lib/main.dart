import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:intl/intl.dart';

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
        Icons.wallet_giftcard_rounded),
    User('Johny', 'johnyfriends@gmail.com', 'johny2', Icons.money),
    User('Max', 'maxfarmer@gmail.com', 'max3', Icons.handyman_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final userNow=userList[1];
    return Scaffold(
        body: Container(
            width: double
                .infinity, // Set the width to fill the entire available space
            height: double
                .infinity, // Set the height to fill the entire available space
            color: const Color(
                0xFFCAFFDC), // Set the background color for the entire screen
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          // CircleAvatar(
                          //   radius:
                          //       50, // Adjust the radius to control the size of the circular image
                          //   backgroundImage: AssetImage('assets/images/jessica.png'), // Replace with your image asset path
                          // ),
                          Icon(userNow.icon, size: 50), //userIcon
                          SizedBox(
                              width:
                                  20), // Add some spacing between the icon and text
                          Text(   //userName
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
                        child: Text(  //displayed email
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
  final IconData icon;

  User(this.name, this.email, this.password, this.icon);
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

class MySpendingPage extends StatefulWidget {
  const MySpendingPage({super.key});
  @override
  _MySpendingPageState createState() => _MySpendingPageState();
}

class _MySpendingPageState extends State<MySpendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double
                .infinity, // Set the width to fill the entire available space
            height: double
                .infinity, // Set the height to fill the entire available space
            color: const Color(
                0xFFCAFFDC), // Set the background color for the entire screen
            child: SingleChildScrollView(
                child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My Spending',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B5E20),
                      ),
                    ),
                  ],
                ),
              ),
            ))));
  }
}

class GroceriesCalculatorPage extends StatefulWidget {
  const GroceriesCalculatorPage({super.key});
  @override
  _GroceriesCalculatorPageState createState() => _GroceriesCalculatorPageState();
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

    if (result != null && result.containsKey('item') && result.containsKey('price')) {
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

    int rowCount = random.nextInt(6) + 1; // Random number of rows between 1 and 6
    final List<int> amountList = [1000, 15000, 25000, 5000, 8000, 100000];
    final List<int> totalAmountList = [50000, 100000, 200000, 300000, 50000];
    final List<String> personList = ['Wani', 'Jennie', 'Miyeon', 'Yeran', 'Adlan', 'Jani', 'Emily', 'Lee', 'Hong'];
    final List<String> titleList = ['Mcdonald', 'Travel', 'Event', 'Drink', 'Travel', 'Dayout', 'Party', 'Cafe', 'Lunch', 'Dinner'];

    for (int i = 0; i < rowCount; i++) {
      String title = titleList[random.nextInt(titleList.length)];
      String month = getMonthNumber(dropdownValue);
      String day = (random.nextInt(30) + 1).toString().padLeft(2, '0');
      String date = '$day/$month/2023';
      String amount = (amountList[random.nextInt(amountList.length)] - 9000).toString();
      String totalAmount = (totalAmountList[random.nextInt(totalAmountList.length)] - 100).toString();
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

      paidTableRows = List.generate(paidRowCount, (index) => tableRows[random.nextInt(tableRows.length)]);
      nonPaidTableRows = tableRows.where((row) => !paidTableRows.contains(row)).toList();
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
            colors: [Color.fromARGB(255, 247, 251, 248)!, Color.fromARGB(255, 247, 250, 248)!],
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
                          ...paidTableRows.map((row) => Row(children: row.children)),
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
                    TextEditingController titleController = TextEditingController();
                    TextEditingController amountController = TextEditingController();
                    TextEditingController totalAmountController = TextEditingController();
                    TextEditingController personController = TextEditingController();
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
                                            style: TextStyle(color: Colors.green, fontSize: 24),
                                          ),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: '-',
                                          child: Text(
                                            '-',
                                            style: TextStyle(color: Colors.red, fontSize: 24),
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
                                    FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
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
                                  String totalAmount = totalAmountController.text;
                                  String person = personController.text;

                                  amount = selectedSign == '+' ? '(+$amount' : '(-$amount';
                                  String formattedDate = getFormattedDate(dropdownValue);

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
                                              color: selectedSign == '+' ? Colors.green : Colors.red,
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