import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: MiCampoTexto(),
  ));
}

class MiCampoTexto extends StatefulWidget {
  @override
  _MiCampoTextoState createState() => new _MiCampoTextoState();
}

class _MiCampoTextoState extends State<MiCampoTexto>
{
  String entradaValor = "";
  // Controlador que se encargará de registrar los cambios de mi TextField.
  final TextEditingController controlador = new TextEditingController();

  // Método que recibe como parámetro el texto ingresado para que sea mostrado en pantalla.
  void Modifico (String valor){
    // Modificamos el State para que, el Text que contendrá mis mensajes sea vuelto a renderizar.
    setState(() {
      entradaValor = entradaValor + "\n" + valor;
      // El método "print" se puede usar para debugear, ya que muestra datos en la consola de abajo.
      print(entradaValor);
      controlador.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        appBar: new AppBar(
          title: new Text("EdiText Ejemplo"),
          backgroundColor: Colors.teal,
        ),

        body: new Container(
          padding: const EdgeInsets.all(15.00),
          child: new Center(
            child: new Column(
              // Alineo el texto a la izquierda.
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                new TextField(
                  // La propedad "decoration" sirve para agregar un "hinText" (o placeHolder) para que se muestre un texto que indique el dato que se espera recibir.
                  decoration: new InputDecoration(hintText: "Ingrese un mensaje"),
                  onSubmitted: (String valores) {Modifico(valores);},
                  // Indico que el controller de este TextField, va a ser "controlador".
                  controller: controlador,
                ),

                new Text(entradaValor)

              ],
            ),
          ),
        )
    );
  }
}