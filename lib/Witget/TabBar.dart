// import 'package:flutter/material.dart';

// myTabBar(
//   TabController tabController, BuildContext context) {
//     return PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: TabBar(
//             controller: tabController,
//             indicatorWeight: 5,
//             indicatorSize: TabBarIndicatorSize.label,
//             labelStyle: Theme.of(context).textTheme.bodyLarge,
//             unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
//             indicatorColor:
//               const Color.fromARGB(255, 255, 193, 203), // Pink indicator for selected tab
//             labelColor:
//               const Color.fromARGB(255, 253, 199, 255), // White color for selected tab text
//             unselectedLabelColor:
//               const Color.fromARGB(255, 241, 216, 255), // Lighter white for unselected tab
//             tabs: const[
//                 Tab(
//                     text: "Chats",
//                 ),
//                 Tab(
//                     text: "Group",
//                 ),
//                 Tab(
//                     text: "Calls",
//                 )
//             ],
//         ),
//       //   Expanded(
//       //     child: TabBarView(
//       //       children: [
//       //         Chatlist(), // The chat tab view
//       //           Center(
//       //             child: Text("Group")
//       //           ), // Group tab view placeholder
//       //        ],
//       //     ),
//       //  ),
//     );
// }

import 'package:flutter/material.dart';

PreferredSizeWidget myTabBar(TabController tabController, BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60), // Adjust height of the TabBar
    child: TabBar(
      controller: tabController,
      indicatorWeight: 5, // Thickness of the indicator
      indicatorSize:
          TabBarIndicatorSize.label, // Indicator size matches the label
      labelStyle:
          Theme.of(context).textTheme.bodyLarge, // Style for selected tab text
      unselectedLabelStyle: Theme.of(context)
          .textTheme
          .labelLarge, // Style for unselected tab text
      indicatorColor:
          const Color.fromARGB(255, 255, 193, 203), // Pink indicator
      labelColor: const Color.fromARGB(
          255, 253, 199, 255), // Pinkish color for selected tab text
      unselectedLabelColor: const Color.fromARGB(
          255, 241, 216, 255), // Lighter pink for unselected tab
      tabs: const [
        Tab(text: "Chats"), // Chat Tab
        Tab(text: "Group"), // Group Tab
        // Tab(text: "Calls"), // Calls Tab
      ],
    ),
  );
}
