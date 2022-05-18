import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'ApiGenerator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final dio = Dio(BaseOptions(contentType: "application/json")); // Provide a dio instance
    dio.options.headers["Demo-Header"] = "demo header"; // config your dio headers globally
    final client = RestClient(dio);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dio/Retrofit tutorial",
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Dio REST API DEMO"),),
        body: FutureBuilder<List<FetchPost>>(
          future: client.getPost(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,vertical: 5
                      ),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFA500),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${snapshot.data![index].id}',style: TextStyle(fontSize: 15,color: Colors.deepOrange),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            '${snapshot.data![index].body}',style: TextStyle(fontSize: 15,color: Colors.deepOrange),
                          ),
                        ],
                      ),
                    ),
                  ));
            }
            else{
              return Container();
            }
          },
        ),
      ),
    );
  }
}

