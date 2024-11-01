import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project33/src/cubit/locale_cubit.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        
      ),
      drawer:const Drawer(),
      body: Center(
        child: Padding(
          padding:const EdgeInsets.all(25),
          child:Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: 'en',
                icon:const Icon(Icons.arrow_drop_down),
                
                items: ["en","ar"].map((e){return DropdownMenuItem<String>(value:e,child: Text(e));}).toList(),
                 onChanged: (value){
                if(value!=null){
                  BlocProvider.of<LocaleCubit>(context).changeLanguage(value);
                }
                 }),
            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        
      },child:const Icon(Icons.add),),
    );
  }
}