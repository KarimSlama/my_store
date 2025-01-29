import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:my_store/my_store/home/controller/home_cubit.dart';
import 'package:my_store/my_store/home/controller/home_state.dart';
import 'package:my_store/my_store/home/widget/toggle_between_layout_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            IconButton(
              onPressed: () => homeCubit.toggleLayout(),
              icon: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Icon(
                    homeCubit.isGridView
                        ? IconBroken.Document
                        : IconBroken.More_Square,
                  );
                },
              ),
            ),
            ToggleBetweenLayoutBlocBuilder(),
          ],
        ),
      ),
    );
  }

  Widget _animatedItem(BuildContext context, int index,
      {required Widget child}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 300 + index * 50),
      // توقيت متدرج لكل عنصر
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:icon_broken/icon_broken.dart';
// import 'package:my_store/my_store/home/controller/home_cubit.dart';
// import 'package:my_store/my_store/home/controller/home_state.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final homeCubit = context.read<HomeCubit>();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Grid / List Toggle'),
//         actions: [
//           IconButton(
//             onPressed: () => homeCubit.toggleLayout(),
//             // تبديل العرض عند الضغط على الأيقونة
//             icon: BlocBuilder<HomeCubit, HomeState>(
//               builder: (context, state) {
//                 return Icon(
//                   homeCubit.isGridView
//                       ? IconBroken.Document
//                       : IconBroken.More_Square, // أيقونة بناءً على نوع العرض
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       body: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           return AnimatedSwitcher(
//             duration: const Duration(milliseconds: 300),
//             child: homeCubit.isGridView
//                 ? _buildGridView(context)
//                 : _buildListView(context),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildGridView(BuildContext context) {
//     return GridView.builder(
//       key: const ValueKey('GridView'),
//       // مفتاح لضمان التبديل السلس
//       padding: const EdgeInsets.all(16.0),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 16.0,
//         mainAxisSpacing: 16.0,
//         childAspectRatio: 1,
//       ),
//       itemCount: 10,
//       // عدد العناصر
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () => log('Item $index clicked'),
//           child: Card(
//             elevation: 4,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.image, size: 50, color: Colors.blue),
//                 const SizedBox(height: 8),
//                 Text('Item $index'),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildListView(BuildContext context) {
//     return ListView.builder(
//       key: const ValueKey('ListView'), // مفتاح لضمان التبديل السلس
//       padding: const EdgeInsets.all(16.0),
//       itemCount: 10, // عدد العناصر
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () => log('Item $index clicked'),
//           child: Card(
//             elevation: 4,
//             margin: const EdgeInsets.only(bottom: 16.0),
//             child: ListTile(
//               leading: Icon(Icons.image, size: 40, color: Colors.blue),
//               title: Text('Item $index'),
//               subtitle: const Text('Subtitle here'),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

///----------------- The base code for mine
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:icon_broken/icon_broken.dart';
// import 'package:local_hero_transform/local_hero_transform.dart';
// import 'package:my_store/core/service_locator/get_it.dart';
// import 'package:my_store/core/theming/app_colors/app_colors.dart';
// import 'package:my_store/core/widgets/custom_app_bar.dart';
// import 'package:my_store/my_store/home/controller/home_cubit.dart';
// import 'package:my_store/my_store/home/widget/categories_list_view.dart';
// import 'package:my_store/my_store/home/widget/toggle_between_layout_bloc_builder.dart';
// import 'package:my_store/my_store/home/widget/toggle_icon_button.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           spacing: 16.h,
//           children: [
//             CustomAppBar(onBackPressed: () {}, isSearch: true),
//             Container(
//               width: double.infinity,
//               height: 170.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(14),
//                 color: AppColors.blue,
//               ),
//               child: Container(),
//             ),
//             CategoriesListView(),
//             ToggleIconButton(),
//             ToggleBetweenLayoutBlocBuilder(),
//           ],
//         ),
//       ),
//     );
//   }
// }
