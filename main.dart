import 'package:flutter/material.dart';

void main() {
  runApp(const VyroApp());
}

class VyroApp extends StatelessWidget {
  const VyroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VYRO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F19),
        primaryColor: const Color(0xFF3B82F6),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF3B82F6),
          secondary: const Color(0xFF8B5CF6),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ReelsScreen(),
    const AddPostScreen(),
    const MessagesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF111827),
        selectedItemColor: const Color(0xFF3B82F6),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library_rounded), label: 'فيديوهات'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 36, color: Color(0xFF8B5CF6)), label: 'نشر'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_rounded), label: 'الرسائل'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'الملف الشخصي'),
        ],
      ),
    );
  }
}

// 1. الصفحة الرئيسية
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VYRO', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: index == 0 ? Colors.blue : Colors.purple,
                        child: const CircleAvatar(
                          radius: 29,
                          backgroundColor: Colors.black,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(index == 0 ? 'قصتك' : 'مستخدم $index', style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(color: Colors.white24),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1F2937),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    CircleAvatar(child: Icon(Icons.person)),
                    SizedBox(width: 10),
                    Text('أحمد علي (@7_98_0)', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('مرحباً بك في تطبيق VYRO! عالمك، محتواك، تواصلك بلا حدود 🚀'),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(child: Icon(Icons.image, size: 50, color: Colors.white54)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 2. شاشة الفيديوهات القصيرة (Reels)
class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                color: index % 2 == 0 ? const Color(0xFF111827) : const Color(0xFF1F2937),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.play_circle_filled, size: 80, color: Colors.white30),
                      const SizedBox(height: 10),
                      Text('فيديو قصير رقم ${index + 1}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                right: 15,
                child: Column(
                  children: const [
                    CircleAvatar(backgroundColor: Colors.black54, child: Icon(Icons.favorite, color: Colors.red)),
                    SizedBox(height: 4),
                    Text('12.5K', style: TextStyle(fontSize: 12)),
                    SizedBox(height: 15),
                    CircleAvatar(backgroundColor: Colors.black54, child: Icon(Icons.comment, color: Colors.white)),
                    SizedBox(height: 4),
                    Text('420', style: TextStyle(fontSize: 12)),
                    SizedBox(height: 15),
                    CircleAvatar(backgroundColor: Colors.black54, child: Icon(Icons.share, color: Colors.white)),
                    SizedBox(height: 4),
                    Text('مشاركة', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              const Positioned(
                bottom: 80,
                left: 15,
                right: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('@7_98_0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 5),
                    Text('تجربة نظام الفيديوهات القصيرة في تطبيق VYRO الجديد 🔥'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// 3. شاشة النشر (+)
class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إنشاء محتوى جديد')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.video_call_rounded, size: 80, color: Color(0xFF8B5CF6)),
            SizedBox(height: 15),
            Text('تصوير فيديو، تعديل، أو رفع منشور', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

// 4. شاشة الرسائل (تشمل المراسلة عبر الإنترنت والمحلية بدون إنترنت)
class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الرسائل'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'الرسائل عبر الإنترنت'),
              Tab(text: 'مراسلة محلية (بدون إنترنت 🛜)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: const [
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text('أحمد محمد'),
                  subtitle: Text('مرحباً، كيف حال التطبيق؟'),
                  trailing: Text('10:42 ص'),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.bluetooth_searching, size: 70, color: Color(0xFF3B82F6)),
                    SizedBox(height: 15),
                    Text('البحث عن أجهزة قريبة عبر Bluetooth / Wi-Fi Direct', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Text('لا توجد أجهزة قريبة حالياً', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 5. شاشة الملف الشخصي
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الملف الشخصي')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: CircleAvatar(radius: 50, backgroundColor: Color(0xFF8B5CF6), child: Icon(Icons.person, size: 50)),
          ),
          const SizedBox(height: 10),
          const Text('@7_98_0', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          const Text('مطور تطبيق VYRO | عالمك، محتواك، تواصلك بلا حدود', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Column(children: [Text('150', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text('المتابِعون')]),
              SizedBox(width: 30),
              Column(children: [Text('45', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text('المتابَعون')]),
              SizedBox(width: 30),
              Column(children: [Text('1.2K', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text('الإعجابات')]),
            ],
          ),
        ],
      ),
    );
  }
}
