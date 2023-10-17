import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/data/models/coffee_model.dart';

import 'package:coffee_shop/data/universaldata/universaldata.dart';
import 'package:coffee_shop/utils/constants.dart';


class CoffeeRepo {
  Future<UniversalData>
  addCoffee(Coffee coffeeModel) async {
    try {
      DocumentReference newCoffee = await FirebaseFirestore.instance
          .collection(FirebaseCollections.coffees)
          .add(coffeeModel.toJson());

      await FirebaseFirestore.instance
          .collection(FirebaseCollections.coffees)
          .doc(newCoffee.id)
          .update({'coffeeId': newCoffee.id});
      return UniversalData(data: ' New Coffee  Added');
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateCoffee(Coffee coffeeModel) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.coffees)
          .doc(coffeeModel.id)
          .update(coffeeModel.toJson());

      return UniversalData(data: 'Coffee Updated');
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> deleteCoffee({required String coffeeId}) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.coffees)
          .doc(coffeeId)
          .delete();

      return UniversalData(data: 'Coffee Delete');
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Stream<Coffee?> getCoffeeById({required String coffeeId}) {
    return FirebaseFirestore.instance
        .collection(FirebaseCollections.coffees)
        .doc(coffeeId)
        .snapshots()
        .map((coffee) {
      if (coffee.exists) {
        return  Coffee.fromJson(coffee.data() ?? {});
      } else {
        return null;
      }
    });
  }

  Stream<List< Coffee>> getCoffee() => FirebaseFirestore.instance
      .collection(FirebaseCollections.coffees)
      .snapshots()
      .map((coffee) =>
      coffee.docs.map((doc) => Coffee.fromJson(doc.data())).toList());
}