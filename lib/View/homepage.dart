import 'package:assesmnet_project/Controller/apicontroller.dart';
import 'package:assesmnet_project/Model/productmodel.dart';
import 'package:assesmnet_project/View/detailpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiController apicontroller = ApiController();
  late Future<List<ProductModel>> getData;

  @override
  void initState() {
    // TODO: implement initState
    getData = apicontroller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getData,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${snapshot.data![index].title}'),
                    leading:
                        Image.network('${snapshot.data![index].thumbnail}'),
                    subtitle: Text((snapshot.data![index].brand != null)
                        ? '${snapshot.data![index].brand}'
                        : ''),
                    trailing: Text('${snapshot.data![index].price}'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              index: index,
                              snapshot: snapshot,
                            ),
                          ));
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
