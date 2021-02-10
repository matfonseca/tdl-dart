import 'package:App/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:App/models/foster.dart';

class FosterSearch extends StatelessWidget {

  final String code;
  final List<Foster> fosters;
  
  FosterSearch({ this.code, this.fosters});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Buscar dueño"),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
          child: MyStatelessWidget(fosters: fosters != null ? fosters : [])
        )
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.foster,
  });
  final Foster foster;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: _FosterDescription(
              foster: this.foster
            ),
          ),
        ],
      ),
    );
  }
}

class _FosterDescription extends StatelessWidget {
  const _FosterDescription({
    Key key,
    this.foster,
  }) : super(key: key);

  final Foster foster;

  @override
  Widget build(BuildContext context) {
    Icon backyardIcon = this.foster.hasBackyard ? Icon(
      Icons.check,
      color: Colors.green,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ) :  Icon(Icons.cancel,
      color: Colors.red,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ) ;

    Icon otherPetsIcon = this.foster.hasOtherPets ? Icon(
      Icons.check,
      color: Colors.green,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ) :  Icon(Icons.cancel,
      color: Colors.red,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ) ;

    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${this.foster.name}, ${this.foster.age}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            'Tel: ${this.foster.phone}',
            style: const TextStyle(fontSize: 15.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            'Cantidad de Roommates: ${this.foster.amountRoommates}',
            style: const TextStyle(fontSize: 15.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            'Tipo de vivienda: ${this.foster.amountRoommates}',
            style: const TextStyle(fontSize: 15.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Row(
            children: [
              Text('Tiene Patio: '),
              backyardIcon
            ],
          ),
          Row(
            children: [
              Text('Tiene otras mascotas: '),
              otherPetsIcon
            ],
          ),
          Divider(color:Colors.black)
        ],
      ),
    );
  }
}


/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {

  final List<Foster> fosters;

  MyStatelessWidget({Key key, this.fosters}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    if(fosters.length == 0){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
                  SizedBox(height: 10),
                  Text("No hay ningun candidato aun!"),
        ]
      );
      
    }

    List<CustomListItem> foster_list = fosters.map((foster) => CustomListItem(foster:foster)).toList();

    return ListView(
      padding: const EdgeInsets.all(20.0),
      itemExtent: 160.0,
      children: foster_list
    );
  }
}