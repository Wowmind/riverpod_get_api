import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_get_api/pages/provider.dart';
import 'package:riverpod_get_api/pages/user_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final myProvider = ref.watch(ApiProver);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Api',
        style: TextStyle(
          color: Colors.teal,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: myProvider.when(data: (myProvider){
        List<user> userList =  myProvider.map((e) =>  e).toList();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: userList.length,
                    itemBuilder: (_, index){
                    return Card(
                      color: Colors.teal,
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(userList[index].name.toString()),

                        subtitle: Text(userList[index].body.toString()),
                        leading: Text(userList[index].id.toString()),
                      ),
                    );
                    }),
              ),
            ],
          ),
        );
      },


          error: (err, s) => Text(err.toString()),
          loading: () => Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}
