import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampark_app/pages/chat/chat_list.dart';
import 'package:sampark_app/widgets/tab_bar.dart';
import 'package:sampark_app/config/images.dart';
import 'package:sampark_app/config/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsImages.logoPNG,
            width: 10.w,
          ),
        ),
        title: Text(
          AppsStrings.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
        ],
        bottom: myTabBar(tabController, context),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          ChatList(), // <-- Corrected this line
          Center(child: Text("Groups")),
          Center(child: Text("Calls")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
