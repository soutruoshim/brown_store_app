import 'package:brown_store/provider/parse_provider.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';
class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    Provider.of<ParseProvider>(context, listen: false).getOrderListAll(context, 2);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LiveList example app'),
        ),
        body:  buildBody(context)

    );
  }
  Widget buildBody(BuildContext context) {

    return Column(
      children: <Widget>[
        Expanded(
          child: ParseLiveListWidget<ParseObject>(
              query: Provider.of<ParseProvider>(context, listen: false).getQueryAll,
              duration: const Duration(seconds: 1),
              childBuilder: (BuildContext context,
                  ParseLiveListElementSnapshot<ParseObject> snapshot) {
                if (snapshot.failed) {
                  return const Text('something went wrong!');
                } else if (snapshot.hasData) {
                  return ListTile(
                    title: Row(
                      children: <Widget>[
                        Flexible(
                          child: Text(snapshot.loadedData!
                              .get('objectId')),
                          flex: 4,
                        ),
                        Flexible(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              snapshot.loadedData!.get<String>('order_no')!,
                            ),
                          ),
                          flex: 10,
                        ),
                      ],
                    ),
                    onLongPress: () {
                      // objectFormKey.currentState!
                      //     .setObject(snapshot.loadedData);
                    },
                  );
                } else {
                  return const ListTile(
                    leading: CircularProgressIndicator(),
                  );
                }
              }),
        ),
        Container(
          color: Colors.black12,
        )
      ],
    );
  }
}
