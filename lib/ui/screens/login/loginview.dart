import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'loginviewmodle.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(viewModelBuilder: () {
      return LoginViewModel();
    }, builder: (BuildContext context, LoginViewModel viewModel, Widget? child) {
      return SafeArea(child: Scaffold(
        body: Form(key: viewModel.formkey,
          child: Padding(
            padding: EdgeInsets.only(left: 20,right: 20,top: 250),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 10),
                  child: Text('Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: viewModel.emailc,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1,color: Colors.grey)
                    ),
                    focusedErrorBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,color: Colors.grey)
                    ),
                    focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,color: Colors.grey)
                    ),
                    disabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,color: Colors.grey)
                    ),
                    enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,color: Colors.grey)
                    ),
                    border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,color: Colors.grey)
                    ),
                    hintText: 'Email',
                  ),
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return'Must fill';
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: viewModel.passc,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,color: Colors.grey)
                    ),
                    focusedErrorBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,color: Colors.grey)
                    ),
                    focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,color: Colors.grey)
                    ),
                    disabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,color: Colors.grey)
                    ),
                    enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,color: Colors.grey)
                    ),
                    border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,color: Colors.grey)
                    ),
                    hintText: 'Password',
                  ),
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return'Must fill';
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: (){
                  viewModel.login();
                }, child:Text('Login'))
              ],
            ),
          ),
        ),
      ));
    },);
  }
}
