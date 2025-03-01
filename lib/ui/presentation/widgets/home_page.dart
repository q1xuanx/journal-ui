import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journal_app/locator.dart';
import 'package:journal_app/ui/domain/entity/post_entity.dart';
import 'package:journal_app/ui/presentation/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _bloc = locator<HomeBloc>();

  @override
  void initState() {
    _bloc.loadDiary();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 246, 239, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 246, 239, 1),
          actions: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.menu,
                color: Color.fromRGBO(116, 76, 76, 100),
                size: 35.0,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            spacing: 5.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Welcome \nback!',
                  style: TextStyle(
                      fontSize: 44.34,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(116, 76, 76, 1)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset('assets/images/banner.png'),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.12),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        color: Color.fromRGBO(116, 76, 76, 1),
                        fontSize: 44.34,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.2,
                width: width,
                child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.listPost == null) {
                          return Center(child: Text('Not have diary yet !'),);
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.listPost!.length,
                          itemBuilder: (context, index) {
                            //log(state.listPost![index].createAt);
                            return _itemHolder(state.listPost![index], height, width);
                          }
                        );
                      },
                    )),
              ),
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'or Start a new one',
                    style: TextStyle(
                      fontSize: 40,
                      color: Color.fromRGBO(116, 76, 76, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Color.fromRGBO(116, 76, 76, 1),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _itemHolder(
          PostEntity postEntity, double height, double width) =>
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Card(
          color: Color.fromRGBO(240, 240, 230, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
            width: height * 0.25,
            height: width * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    postEntity.title!,
                    style: TextStyle(
                        color: Color.fromRGBO(116, 76, 76, 1), fontSize: 16.0),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(postEntity.createdAt.toString().split('.')[0],
                        style: TextStyle(
                            color: Color.fromRGBO(116, 76, 76, 1),
                            fontSize: 14.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
