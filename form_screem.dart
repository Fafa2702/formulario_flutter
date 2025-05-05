import 'package:flutter/material.dart';

 
class FormScreem extends StatefulWidget {
  const FormScreem({super.key});

  @override
  State<FormScreem> createState() => FormScreemState();
}

class FormScreemState extends State<FormScreem> {
  TextEditingController nameController = TextEditingController();
  TextEditingController DificultyController = TextEditingController();
  TextEditingController ImageController = TextEditingController();

  final _formkey = GlobalKey<FormState>(); // criação de chave

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 365,
              decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value){
                        if (value != null && value.isEmpty) {
                          return'insira o nome da Tarefass';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                        
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value){
                        if (value!.isEmpty || int.parse(value) > 5  || int.parse(value) < 1){
                          return'insira uma dificuldade entre 1 e 5';
                        }
                        return null;
                      } ,
                      keyboardType: TextInputType.number,
                      controller: DificultyController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade',
                        fillColor: Colors.white70,
                        filled: true,
                        
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (text){
                          setState(() {
                            
                          });
            
                      },
                      validator: (value){
                        if (value!.isEmpty) {
                          return'Insira um url de imagem';
                        }
                        return  null;
                      },
                      keyboardType: TextInputType.url,
                      controller: ImageController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem',
                        fillColor: Colors.white70,
                        filled: true,
                        
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.blue)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                    ImageController.text, 
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                      return Image.asset('foto nao carregada');
                    },
                    fit: BoxFit.cover ,
                    ),
                    
                    ),
            
                  ),
                  ElevatedButton(onPressed: (){
                    if (_formkey.currentState!.validate()) {
                    print(nameController.text);
                    print(int.parse(DificultyController.text));
                    print(ImageController.text);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tarefa salva')
                    )
                  );
                  Navigator.pop(context);
                }   

              }, 
                  child: Text('adicionar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}