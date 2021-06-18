import 'package:customerlogin/mixins/validation_mixins.dart';
import 'package:customerlogin/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomerAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomerAddState();
}

class CustomerAddState extends State with ValidationMixin {
  // global form key for Form
  final _formKey = GlobalKey<FormState>();
  // customer
  final customer = Customer();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            //let's create user inputs with methods
            // These inputs include "name lastname email password"
            // I create these inputs as methods so that we could call them in column
            firstNameField(),
            lastNameField(),
            emailField(),
            passwordField(),
            submitButton()
          ],
        ),
      ),
    );
  }

  // 4 Textfield methods down there as widgets;

  Widget firstNameField() {
    return TextFormField(
      decoration: InputDecoration(
          // we use inputdecoration field for labeling input
          labelText: "name",
          hintText: "exp: Dennis"),
      validator: validateFirstName,
      onSaved: (String? value) {
        customer.firstName = value;
      },
    );
  }

  Widget lastNameField() {
    return TextFormField(
      decoration: InputDecoration(
          // we use inputdecoration field for labeling input
          labelText: "Lastname",
          hintText: "surname"),
      validator: validateLastName,
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      // we use inputdecoration field for labeling input
      decoration:
          InputDecoration(labelText: "Email", hintText: "exp: abc@mail.com"),
      validator: validateEmail,
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true, // it hides the password field ****

      // we use inputdecoration field for labeling input
      decoration: InputDecoration(labelText: "password", hintText: "password"),
    );
  }

// SAVE BUTTON CREATİON down there

  Widget submitButton() {
    return ElevatedButton(
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.

          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.

            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));

            _formKey.currentState!.save();
            // in here we can send values to Apı if we want to
            saveCustomer(customer);
          }
        },
        child: Text("SAVE"));
  }

  void saveCustomer(Customer customer) {
    // we can call APı in here
    print("customer could be saved to the Apı if we want to");
  }
}
