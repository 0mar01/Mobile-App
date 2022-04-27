import 'package:flutter/material.dart';

List<String> categore = ['Adults', 'Children', 'Women'];
String Selected = categore[0];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void mychange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        backgroundColor: Colors.white70,
        elevation: 10,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white70,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://wallpaperaccess.com/full/2213424.jpg"),
              ),
              accountName: Text(
                "Omar Khaled",
                style: Theme.of(context).textTheme.headline6,
              ),
              accountEmail: Text(
                "omarkhaled01@gmail.com",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Find Your \nConsultation",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 20, color: Colors.grey[400]),
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: ListView.builder(
                  itemCount: categore.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Categories(
                      isSelected: Selected == categore[index],
                      category: categore[index],
                      States: this,
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    width: 180,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.orange[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(20),
                      children: [
                       const  Text(
                          "Cough &\nCold",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                       const  SizedBox(height: 5),
                        const Text(
                          "10 Doctors",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 30),
                        Image.network(
                          "https://wallpaperaccess.com/full/2213424.jpg",
                          width: 50,
                          height: 100,
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 180,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Color(0xFFf4a8a1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.all(20),
                        children: [
                          const Text(
                            "Heart\nSpecialist",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "17 Doctors",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 30),
                          Image.asset(
                            "assets/image/flower.jpeg",
                            width: 50,
                            height: 100,
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  bool isSelected;
  String category;
  _HomeScreenState States;

  Categories(
      {required this.isSelected, required this.category, required this.States});
  //Function changeSelected;
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // changeSelected(index);
        setState(() {
          Selected = widget.category;
          widget.States.mychange();
        });
      },
      child: Container(
        height: 30,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: widget.isSelected ? Colors.orange[100] : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          widget.category,
          style: TextStyle(
            fontSize: 15,
            color: widget.isSelected ? Colors.orange[300] : Colors.grey,
          ),
        ),
      ),
    );
  }
}
