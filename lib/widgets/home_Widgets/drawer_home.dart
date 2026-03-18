import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 45,
              child: Image.asset(
                'assets/images/main_design/main_logo.png',

                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 12),
            const Text(
              "Fire Safty Academy",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8), // قللت المسافة عشان أقرب شوية للنص
                const Text(
                  "Mohamed Sultan",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 25),

            const Divider(),

            Expanded(
              child: ListView(
                children: [
                  _drawerItem(
                    icon: Icons.notifications,
                    title: "Notifications",
                    onTap: () {},
                  ),
                  _drawerItem(
                    icon: Icons.search,
                    title: "search",
                    onTap: () {},
                  ),

                  _drawerItem(
                    icon: Icons.settings,
                    title: "settings",
                    onTap: () {},
                  ),

                  _drawerItem(
                    icon: Icons.help_outline,
                    title: "help",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const Divider(),

            Container(
              height: 45,
              decoration: BoxDecoration(
                border: BoxBorder.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Center(
                child: AutoSizeText(
                  'Sultan SecureTech',
                  style: const TextStyle(
                    fontFamily: 'Lobster',
                    color: Colors.blue,
                  ),
                  maxLines: 1,
                  minFontSize: 8, // أصغر حجم ممكن
                  maxFontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isHover = false;

        return MouseRegion(
          onEnter: (context) => setState(() => isHover = true),
          onExit: (context) => setState(() => isHover = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: isSelected
                  ? Theme.of(context).primaryColor.withOpacity(0.1)
                  : isHover
                  ? Colors.blue.withOpacity(0.05)
                  : Colors.transparent,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 4,
              ),

              leading: Icon(
                icon,
                size: 22,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),

              title: Text(
                title,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),

              trailing: isSelected
                  ? Container(
                      width: 6,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : null,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),

              onTap: onTap,
            ),
          ),
        );
      },
    );
  }
}
