import 'package:flutter/material.dart';

Widget buildSearchField(BuildContext context) {
  return Padding(
    padding:
        const EdgeInsets.fromLTRB(16, 35, 16, 15), // Ajusta el padding superior aquí
    child: Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          labelStyle: TextStyle(
              color: Theme.of(context)
                  .primaryColor), // Cambia el color de la etiqueta
          hintStyle: TextStyle(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(0.5)), // Cambia el color del texto de sugerencia
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor:
              Theme.of(context).primaryColor, // Cambia el color del cursor
        ),
      ),
      child: TextFormField(
        autofocus: false,
        autofillHints: const [AutofillHints.email],
        obscureText: false,
        decoration: const InputDecoration(
          labelText: 'Post-In',
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
          suffixIcon: Icon(Icons.filter_list_outlined),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    ),
  );
}
