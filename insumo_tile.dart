import 'package:brasil_fields/brasil_fields.dart';
import 'package:ficha10/app/modules/insumo/models/insumo_model.dart';
import 'package:flutter/material.dart';

class InsumoTile extends StatelessWidget {
  final InsumoModel insumo;
  final VoidCallback onPress;
  // final VoidCallback onPressEdit;

  const InsumoTile({Key? key, required this.insumo, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        insumo.title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      ),
      subtitle: Text(
          'Custo por ${insumo.unitMeasure == 'QUILOGRAMA' ? 'grama' : insumo.unitMeasure.toLowerCase()}: ${UtilBrasilFields.obterReal(insumo.custoUnd ?? 0)}'),
      trailing: Wrap(
        spacing: -8,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/insumosForm', arguments: insumo);
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: onPress,
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
