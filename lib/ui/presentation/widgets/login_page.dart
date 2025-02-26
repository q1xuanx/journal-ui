import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journal_app/locator.dart';
import 'package:journal_app/ui/presentation/bloc/user_bloc.dart';
import 'package:journal_app/ui/presentation/widgets/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _bloc = locator<UserBloc>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 246, 239, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: height * 0.05),
              child: Center(
                child: SizedBox(
                  height: height * 0.2,
                  child: Title(
                      color: Color.fromRGBO(116, 76, 76, 1),
                      child: Center(
                        child: Text('Journal App',
                            style: TextStyle(
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(116, 76, 76, 1))),
                      )),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Welcome back !',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(116, 76, 76, 1)),
                                  )),
                            ),
                            TextFormField(
                              initialValue: _bloc.state.username,
                              onChanged: (value) =>
                                  _bloc.state.username = value,
                              decoration: InputDecoration(
                                  labelText: 'Username',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  hintText: 'Username',
                                  alignLabelWithHint: true),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              obscureText: true,
                              initialValue: _bloc.state.password,
                              onChanged: (value) => _bloc.state.password = value,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  hintText: 'Password',
                                  alignLabelWithHint: true),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: SizedBox(
                                  height: height * 0.05,
                                  width: width * 0.5,
                                  child: BlocBuilder<UserBloc, UserState>(
                                    builder: (context, state) {
                                      return TextButton(
                                          style: ButtonStyle(
                                              animationDuration:
                                                  Durations.short2),
                                          onPressed: ()  async {
                                            int result = await _bloc.login(state.username, state.password);
                                            if (result != -1){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomePage()));
                                            }else {
                                              SnackBar(content: Text('Error username or password'),);
                                            }
                                          },
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                                fontSize: 17.0,
                                                color: Color.fromRGBO(
                                                    116, 76, 76, 1)),
                                          ));
                                    },
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(
                                'Dont have account ? |',
                                style: TextStyle(fontSize: 17.0),
                              ),
                              Divider(
                                indent: 1.0,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(fontSize: 15.0),
                                  ))
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
