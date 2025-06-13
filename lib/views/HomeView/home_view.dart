// import 'package:elearningapp/utils/colors.dart';
// import 'package:elearningapp/views/HomeView/widgets/appbar.dart';
// import 'package:flutter/material.dart';
// import 'category_detail_view.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;

//     List<Map<String, dynamic>> categories = [
//       {
//         "icon": "assets/images/English.jpg",
//         "name": "English",
//         "totalCourses": 70,
//       },
//       {
//         "icon": "assets/images/Appdev.jpg",
//         "name": "Programming",
//         "totalCourses": 170,
//       },
//       {
//         "icon": "assets/images/accounting.png",
//         "name": "Accounting",
//         "totalCourses": 16,
//       },
//       {
//         "icon": "assets/images/marketing.jpg",
//         "name": "Marketing",
//         "totalCourses": 27,
//       },
//       {
//         "icon": "assets/images/Photography.jpg",
//         "name": "Photography",
//         "totalCourses": 72,
//       },
//       {
//         "icon": "assets/images/Desining.jpg",
//         "name": "Designing",
//         "totalCourses": 120,
//       },
//     ];

//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           homeAppbar(
//               size), // Use const since HomeAppbar() is a const constructor
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Explore Categories',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 20,
//                           ),
//                         ),
//                         Text(
//                           'Sell All',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 15,
//                             color: AppColors.primary,
//                           ),
//                         ),
//                       ],
//                     ),
//                     GridView.builder(
//                       itemCount: categories.length,
//                       shrinkWrap: true,
//                       primary: false,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2),
//                       itemBuilder: (context, index) {
//                         final data = categories[index];
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => CategoryDetailView(
//                                   name: data['name'],
//                                   image: data['icon'],
//                                   totalCourses: data['totalCourses'],
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.all(5.0),
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20)),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color(0x23000000),
//                                   blurRadius: 7,
//                                   spreadRadius: 0,
//                                   offset: Offset(0, 4),
//                                 ),
//                               ],
//                             ),
//                             child: Column(
//                               children: [
//                                 Image.asset(
//                                   data['icon'],
//                                   width: 120,
//                                   height: 100,
//                                 ),
//                                 const SizedBox(height: 1),
//                                 Text(
//                                   data['name'],
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 19,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 1),
//                                 Text(
//                                   'Total Courses: ${data['totalCourses']}',
//                                   style: const TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:elearningapp/utils/colors.dart';
// import 'package:elearningapp/views/HomeView/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'category_detail_view.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> categories = [
    {
      "icon": "assets/images/English.jpg",
      "name": "English",
      "totalCourses": 70,
    },
    {
      "icon": "assets/images/Appdev.jpg",
      "name": "Programming",
      "totalCourses": 170,
    },
    {
      "icon": "assets/images/accounting.png",
      "name": "Accounting",
      "totalCourses": 16,
    },
    {
      "icon": "assets/images/marketing.jpg",
      "name": "Marketing",
      "totalCourses": 27,
    },
    {
      "icon": "assets/images/Photography.jpg",
      "name": "Photography",
      "totalCourses": 72,
    },
    {
      "icon": "assets/images/Desining.jpg",
      "name": "Designing",
      "totalCourses": 120,
    },
  ];

  List<Map<String, dynamic>> get _filteredCategories {
    if (_searchQuery.isEmpty) return [];
    return categories
        .where((cat) =>
            cat['name'].toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom AppBar with search
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 15,
                  right: 15,
                  bottom: 10,
                ),
                height: size.height * .25,
                width: size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.primary,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Good Morning',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.3),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.notifications,
                                color: Colors.white),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orangeAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                top: 120,
                child: TextFormField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (val) {
                    setState(() {
                      _searchQuery = val;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    hintText: 'Search Your Topics',
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.mic, color: Colors.white),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: _searchQuery.isNotEmpty
                  ? _filteredCategories.isEmpty
                      ? const Center(
                          child: Text(
                            'No results found.',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: _filteredCategories.length,
                          itemBuilder: (context, index) {
                            final data = _filteredCategories[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CategoryDetailView(
                                      name: data['name'],
                                      image: data['icon'],
                                      totalCourses: data['totalCourses'],
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                color: AppColors.card,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      data['icon'],
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Text(
                                    data['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Total Courses: ${data['totalCourses']}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  trailing: const Icon(Icons.arrow_forward_ios,
                                      color: AppColors.primary),
                                ),
                              ),
                            );
                          },
                        )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Explore Categories',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Sell All',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          GridView.builder(
                            itemCount: categories.length,
                            shrinkWrap: true,
                            primary: false,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              final data = categories[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => CategoryDetailView(
                                        name: data['name'],
                                        image: data['icon'],
                                        totalCourses: data['totalCourses'],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x23000000),
                                        blurRadius: 7,
                                        spreadRadius: 0,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        data['icon'],
                                        width: 120,
                                        height: 100,
                                      ),
                                      const SizedBox(height: 1),
                                      Text(
                                        data['name'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                        ),
                                      ),
                                      const SizedBox(height: 1),
                                      Text(
                                        'Total Courses: ${data['totalCourses']}',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
