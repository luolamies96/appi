import 'package:flutter/material.dart';
import 'package:flutterprojo/models/post.dart';
import 'package:flutterprojo/services/service.dart';

class API_showcase extends StatefulWidget {
  const API_showcase({super.key});

  @override
  State<API_showcase> createState() => _API_showcaseState();
}

class _API_showcaseState extends State<API_showcase> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

//hakee dataaa API:lta
    getData();
  }

  getData() async {
    posts = await Service().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API in use'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                 Text(
                posts![index].title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 24,
                 fontWeight: FontWeight.bold),
              ),
              Text(
                posts![index].body,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12,
                 ),
              ),
              ],
              ),
            );
          },
        ),
      ),
    );
  }
}
