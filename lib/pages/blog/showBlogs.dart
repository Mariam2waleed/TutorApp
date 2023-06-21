import 'package:flutter/material.dart';
// import 'package:pb_ch_education_new_version/presentation/screens/blog/addBlogs.dart';
import 'package:tutor/pages/blog/addBlogs.dart';

class ShowBlogs extends StatefulWidget {
  const ShowBlogs({super.key});

  @override
  State<ShowBlogs> createState() => _ShowBlogsState();
}

class _ShowBlogsState extends State<ShowBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          "Posts",
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10.0)),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/147/147142.png?w=740&t=st=1687160254~exp=1687160854~hmac=665581a558d3cd971a9f0cee5bdfea2a1b4db2ad0f58f07875ae91cc4facb90b",
                        width: 80.0,
                        height: 100.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ahmed Ashraf",
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          // SizedBox(
                          //   height: 5.0,
                          // ),
                          Text(
                            "12 / 7 / 2023",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          SizedBox(
                            width: 250.0,
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                              style: TextStyle(
                                  color: Colors.purple[200],
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddBlog()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
