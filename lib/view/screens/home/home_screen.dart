import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/router/ds_next_routes.dart';
import '../../../logic/provider/formular_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed(DsNextRoutes.newForm),
      ),
      body: ref.watch(formularProvider).when(data: (data) {
        return SingleChildScrollView(
          child: Column(
            children: data.values.map((e) {
              return Text(e.name);
            },).toList(),
          ),
        );
      }, error: (error, stackTrace) {
        return const Text("Hoppala, da ist wohl ein Fehler aufgetreten!");
      }, loading: () {
        var size = MediaQuery.of(context).size.shortestSide * 0.4;
        return Center(
          child: SizedBox(
            width: size,
            height: size,
            child: const CircularProgressIndicator(),
          ),
        );
      },),
    );
  }
}