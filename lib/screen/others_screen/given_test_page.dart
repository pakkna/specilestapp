import 'package:flutter/material.dart';

class GivenTestPage extends StatefulWidget {
  const GivenTestPage({Key? key}) : super(key: key);

  @override
  State<GivenTestPage> createState() => _GivenTestPageState();
}

class _GivenTestPageState extends State<GivenTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Given Test'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, i) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                title: Text('title'),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          //EditOrderLabTest
                        },
                        icon: const Icon(Icons.edit),
                        color: Theme.of(context).primaryColor,
                      ),
                      IconButton(
                        onPressed: () async {
                          //DeleteOrderLabTest API
                        },
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
