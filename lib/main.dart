import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get textAlign => null;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/Login': (context) => LoginScreen(),
        '/MarketPlace': (context) => MarketPlace(),
        '/ContractManagement': (context) => ContractManagement(),
        '/HomePage': (context) => HomePage(),
        '/Signup': (context) => Signup(),
        '/CreateContract': (context) => CreateContract(),
        '/ExistingContracts': (context) => ExistingContracts(),
        '/PendingContracts': (context) => PendingContracts()
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  TextEditingController emailInputController = new TextEditingController();
  TextEditingController pwdInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          toolbarHeight: 60,
          title: const Text("Foshan"),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Foshan's Details "),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                title: Text('Market'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Trade Details'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Finance'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Analysis'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.lightBlueAccent[100],
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 130),
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Email",
                      hintText: 'Enter your Email'),
                      controller: emailInputController,
                ),
                SizedBox(height: 15),
                TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: "Password",
                        hintText: "Enter your password",
                        counterText: "Forgot Password?",
                    ),
                    controller: pwdInputController,
                ),

                RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/HomePage');
                  },
                ),
                SizedBox(height: 30),
                Text("Do not have an account?"),
                RaisedButton(
                  child: Text("Register here!"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Signup');
                  },
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    SignInButton(Buttons.Google, mini: false, onPressed: () {}),
                    SizedBox(height: 10),
                    SignInButton(Buttons.LinkedIn,
                        mini: false, onPressed: () {})
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class Signup extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameInputController;
  TextEditingController companyInputController;
  TextEditingController designationInputController;
  TextEditingController emailInputController;
  TextEditingController countryInputController;
  TextEditingController phoneInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;

  @override
  void initState() {
    nameInputController = new TextEditingController();
    companyInputController = new TextEditingController();
    designationInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    countryInputController = new TextEditingController();
    phoneInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          toolbarHeight: 60,
          title: const Text("Foshan"),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Foshan's Details "),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                title: Text('Market'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Trade Details'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Finance'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Analysis'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.lightBlueAccent[100],
        body: Center (
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Name',
                              hintText: 'Name',
                            ),
                            controller: nameInputController,
                            validator: (value) {
                              if(value.length < 3){
                                return 'Please enter a valid name!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),                              labelText: 'Company',
                              hintText: "Company",
                            ),
                            controller: companyInputController,
                            validator: (value) {
                              if(value.length < 2){
                                return 'Company Name not long enough';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),                              labelText: 'Designation',
                              hintText: "Designation",
                            ),
                            controller: designationInputController,
                            validator: (value) {
                              if(value.length < 2){
                                return 'Not long enough';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),                              labelText: 'Email',
                              hintText: "eg. abc@xyz.com",
                            ),
                            controller: emailInputController,
                            validator: (value) {
                              if (!EmailValidator.validate(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),                              labelText: 'Country',
                              hintText: "Country",
                            ),
                            controller: countryInputController,
                            validator: (value) {
                              if(value.length < 2){
                                return 'Enter a valid country name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),                              labelText: 'Phone No.',
                              hintText: "Number",
                            ),
                            controller: phoneInputController,
                            validator: (value) {
                              var potentialNumber = int.tryParse(value);
                              if (potentialNumber == null) {
                                return 'Enter a valid phone number';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),                              labelText: 'Password',
                              hintText: 'Password',
                            ),
                            controller: pwdInputController,
                            obscureText: true,
                            validator: pwdValidator,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),                              labelText: 'Confirm Password',
                              hintText: 'Confirm Password',
                            ),
                            controller: confirmPwdInputController,
                            obscureText: true,
                            validator: pwdValidator,
                          ),
                        ),
                        RaisedButton(
                            child: Text('Register'),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Registered"),
                                      content: Text(
                                          "You have been registered. Please login with your email ID"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Close"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  }
                              );
                            }
                        ),
                        SizedBox(height: 30),
                        Text("Already have an account?"),
                        RaisedButton(
                          child: Text("Login here!"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                )
            )
        )
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        toolbarHeight: 60,
        title: const Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Foshan's Details "),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            ListTile(
              title: Text('Market'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Trade Details'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Finance'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Analysis'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Login');
              },
              child: Text("Log Out"),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlueAccent[100],
      body: Container(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height - 100) / 2,
              child: RaisedButton(
                child:
                    Text("Contract Management", style: TextStyle(fontSize: 30)),
                onPressed: () {
                  Navigator.pushNamed(context, '/ContractManagement');
                },
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height - 100) / 2,
              child: RaisedButton(
                child: Text("Market Place", style: TextStyle(fontSize: 30)),
                onPressed: () {
                  Navigator.pushNamed(context, '/MarketPlace');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContractManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        toolbarHeight: 60,
        title: const Text("Contract Management"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Foshan's Details "),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            ListTile(
              title: Text('Market'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pushNamed(context, '/MarketPlace');
              },
            ),
            ListTile(
              title: Text('Trade Details'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Finance'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Analysis'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Login');
              },
              child: Text("Log Out"),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlueAccent[100],
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3 - 50,
              child: RaisedButton(
                child: Text("Create Contract", style: TextStyle(fontSize: 30)),
                onPressed: () {
                  Navigator.pushNamed(context, '/CreateContract');
                },
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3 - 50,
              child: RaisedButton(
                child:
                    Text("Existing Contracts", style: TextStyle(fontSize: 30)),
                onPressed: () {
                  Navigator.pushNamed(context, '/ExistingContracts');
                },
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3 - 50,
              child: RaisedButton(
                child:
                    Text("Pending Contracts", style: TextStyle(fontSize: 30)),
                onPressed: () {
                  Navigator.pushNamed(context, '/PendingContracts');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MarketPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            toolbarHeight: 100,
            title: const Text("Market Place"),
            bottom: TabBar(
              tabs: [
                Tab(text: "Demand"),
                Tab(text: "Supply"),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text("Foshan's Details "),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                ),
                ListTile(
                  title: Text('Market'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Trade Details'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Finance'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Analysis'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Navigator.pop(context);
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Login');
                  },
                  child: Text("Log Out"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                  child: Text(
                "Sample Demand",
                style: TextStyle(fontSize: 30),
              )),
              Center(
                  child: Text(
                "Sample Supply",
                style: TextStyle(fontSize: 30),
              )),
            ],
          ),
        ));
  }
}

class CreateContract extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController goods = new TextEditingController();
  TextEditingController quantity = new TextEditingController();
  TextEditingController decidedPrice = new TextEditingController();
  TextEditingController sourcePlace = new TextEditingController();
  TextEditingController destinationPlace = new TextEditingController();
  TextEditingController deadlineDate = new TextEditingController();
  TextEditingController currencyFormat = new TextEditingController();
  TextEditingController nameFirstParty = new TextEditingController();
  TextEditingController nameSecondParty = new TextEditingController();
  TextEditingController roleFirstParty = new TextEditingController();
  TextEditingController roleSecondParty = new TextEditingController();

  final dbRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          toolbarHeight: 60,
          title: const Text("Create Contracts"),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Foshan's Details "),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                title: Text('Market'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pushNamed(context, '/MarketPlace');
                },
              ),
              ListTile(
                title: Text('Trade Details'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Finance'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Analysis'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Login');
                },
                child: Text("Log Out"),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.lightBlueAccent[100],
        body: Center(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Name of First Party',
                              hintText: 'Name of First Party',
                            ),
                            controller: nameFirstParty,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Role of First Party',
                              hintText: "Buyer/Seller",
                            ),
                            controller: roleFirstParty,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Name of Second Party',
                              hintText: 'Name of Second Party',
                            ),
                            controller: nameSecondParty,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Role of Second Party',
                              hintText: "Buyer/Seller",
                            ),
                            controller: roleSecondParty,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Goods',
                              hintText: "Goods",
                            ),
                            controller: goods,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Quantity',
                              hintText: "Quantity of Goods",
                            ),
                            controller: quantity,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Decided Price',
                              hintText: "Decided Price",
                            ),
                            controller: decidedPrice,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Currency Format',
                              hintText: "Currency Format",
                            ),
                            controller: currencyFormat,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Source',
                              hintText: 'Source',
                            ),
                            controller: sourcePlace,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Destination',
                              hintText: 'Destination',
                            ),
                            controller: destinationPlace,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Deadline',
                              hintText: 'Deadline',
                            ),
                            controller: deadlineDate,
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        RaisedButton(
                            child: Text('Create Contract'),
                            onPressed: () {
                              var uuid = Uuid().v1();
                              dbRef.child(uuid.toString()).set({
                                "firstParty": nameFirstParty.text,
                                "roleFirstParty": roleFirstParty.text,
                                "secondParty": nameSecondParty.text,
                                "roleSecondParty": roleSecondParty.text,
                                "goods": goods.text,
                                "quantity": quantity.text,
                                "decidedPrice": decidedPrice.text,
                                "currencyFormat": currencyFormat.text,
                                "source": sourcePlace.text,
                                "destination": destinationPlace.text,
                                "deadline": deadlineDate.text
                              }).then((_) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Successful!"),
                                        content: Text(
                                            "Successfully added your contract"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("Close"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    }
                                );
                                goods.clear();
                                quantity.clear();
                                decidedPrice.clear();
                                sourcePlace.clear();
                                destinationPlace.clear();
                                deadlineDate.clear();
                                currencyFormat.clear();
                                nameFirstParty.clear();
                                nameSecondParty.clear();
                                roleFirstParty.clear();
                                roleSecondParty.clear();
                              }).catchError((onError) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Error"),
                                        content: Text(onError.toString()),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("Close"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    }
                                );
                              });
                            }
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}

class ExistingContracts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          toolbarHeight: 60,
          title: const Text("Existing Contracts"),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Foshan's Details "),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                title: Text('Market'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pushNamed(context, '/MarketPlace');
                },
              ),
              ListTile(
                title: Text('Trade Details'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Finance'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Analysis'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Login');
                },
                child: Text("Log Out"),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.lightBlueAccent[100],
        body: ListTile());
  }
}

class PendingContracts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          toolbarHeight: 60,
          title: const Text("Pending Contracts"),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Foshan's Details "),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                title: Text('Market'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pushNamed(context, '/MarketPlace');
                },
              ),
              ListTile(
                title: Text('Trade Details'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Finance'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Analysis'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Login');
                },
                child: Text("Log Out"),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.lightBlueAccent[100],
        body: ListTile());
  }
}
