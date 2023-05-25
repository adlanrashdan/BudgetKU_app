import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';


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
                'Welcome !', // Welcome! - text
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8), // Add spacing
              const Text(
                'Log in to', // Log in to - text
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8), // Add spacing
              const Text(
                'BUDGETKU is simply', // BUDGETKU is simply - text
                style: TextStyle(
                  fontSize: 16,
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
              const SizedBox(height: 8), // Add spacing
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
                    onPressed: () {
                      // Forgot Password? - text only
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 16), // Add spacing
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Login Button (center)
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
                        'Welcome !', // Welcome! - text
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8), // Add spacing
                      const Text(
                        'Sign up to', // Sign up to - text
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8), // Add spacing
                      const Text(
                        'BUDGETKU is simply', // BUDGETKU is simply - text
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16), // Add spacing
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
  Color alarmColor=Colors.grey;
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
                        'My Page',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16), // Add spacing
                      Row(
                        children: [
                          // CircleAvatar(
                          //   radius:
                          //       50, // Adjust the radius to control the size of the circular image
                          //   backgroundImage: AssetImage('assets/images/jessica.png'), // Replace with your image asset path
                          // ),
                          Icon(Icons.people, size: 50),
                          SizedBox(
                              width:
                                  20), // Add some spacing between the icon and text
                          const Text(
                            'Jessica',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12), // Add spacing
                      const Text(
                        'Edit profile',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12), // Add spacing
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
                          hintText: 'Enter your email',
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
                                  178), // Add some spacing between the icon and text
                          InkWell(
                            child: Icon(
                                alarmOn ? Icons.toggle_on : Icons.toggle_off,
                                size: 50,color: alarmColor,),
                            onTap: () {
                              setState(() {
                                alarmOn = !alarmOn;
                                alarmColor = alarmColor == Colors.black ? Colors.grey : Colors.black;
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
