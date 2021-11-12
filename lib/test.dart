import 'package:festival/bouton_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<test> {
  final textController1 = TextEditingController();
  bool isChecked = true;
  bool isChecked1 = false;
  bool isChecked2 = true;
  bool isChecked3 = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    return Center(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          RichText(
              text: TextSpan(
                text: 'Recommanderiez vous ce festival ?',
                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),
                children: const <TextSpan>[
                 ],

              ),

          ),

        CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text('Oui'),
        checkColor: Colors.white,

        value: isChecked1,
        onChanged: (bool? value) {
          setState(() {
            isChecked1 = value!;
            if (isChecked = true) {
              isChecked = false;

            }

          });
        },
      ),
          CheckboxListTile(
            checkColor: Colors.white,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('Non'),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
                if (isChecked1 = true) {
                  isChecked1 = false;

                }
              });
            },
          ),
          SizedBox(height: 40,),
          TextFormField(
            autocorrect: true,
            controller: textController1,
            decoration: InputDecoration(
              labelText: 'Pour quelles raisons ?',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.black, width: 3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.green, width: 3),
              ),
            ),
          ),
SizedBox(height: 50,),
          RichText(
            text: TextSpan(
              text: "Reviendrez vous l'année suivante",
              style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),
              children: const <TextSpan>[
              ],

            ),

          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('Oui'),
            checkColor: Colors.white,

            value: isChecked2,
            onChanged: (bool? value) {
              setState(() {
                isChecked2 = value!;
                if (isChecked3 = true) {
                  isChecked3 = false;

                }

              });
            },
          ),
          CheckboxListTile(
            checkColor: Colors.white,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('Non'),
            value: isChecked3,
            onChanged: (bool? value) {
              setState(() {
                isChecked3 = value!;
                if (isChecked2 = true) {
                  isChecked2 = false;

                }
              });
            },
          ),
          SizedBox(height: 30,),


        ],
      ),
    );
  }
}

