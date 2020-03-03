import 'package:flutter/material.dart';
import 'package:numerical_methods/model/method.dart';
import 'package:numerical_methods/model/subject.dart';
import 'package:numerical_methods/page/subject_page.dart';
import 'package:numerical_methods/tablet_detector.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Subject> _subjects = [
    Subject(name: 'Raízes', methods: [
      Method(name: 'Bisseção'),
      Method(name: 'Newton'),
      Method(name: 'Secantes'),
    ]),
    Subject(name: 'Sistema de Equações Lineares', methods: [
      Method(name: 'Eliminação de Gauss'),
      Method(name: 'Decomposição LU'),
      Method(name: 'Jacobi-Richardson'),
      Method(name: 'Gauss-Seidel'),
    ]),
    Subject(name: 'Interpolação', methods: [
      Method(name: 'Lagrange'),
      Method(name: 'Newton'),
    ]),
    Subject(name: 'Integração Numérica', methods: [
      Method(name: 'Trapézio'),
      Method(name: '1/3 de Simpson'),
      Method(name: '3/8 de Simpson'),
    ]),
    Subject(name: 'Equações Diferenciais Ordinárias', methods: [
      Method(name: 'Runge-Kutta 4ª Ordem'),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Métodos Numéricos"),
      ),
      body: SafeArea(
        bottom: false,
        child: _buildBody(),
      ),
    );
  }

  _buildBody() {
    bool isTablet = TabletDetector.isTablet(MediaQuery.of(context));
    var isLarge = MediaQuery.of(context).size.width > 600;

    return GridView.count(
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 3,
      padding: EdgeInsets.all(20),
      crossAxisCount: isTablet ? (isLarge ? 3 : 2) : (isLarge ? 2 : 1),
      children: List.generate(_subjects.length, (index) {
        Subject subject = _subjects[index];
        return GestureDetector(
          onTap: () => _onClickSubject(subject),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20 - .0),
              child: Row(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    child: Text(
                      subject.name,
                      style: Theme.of(context).textTheme.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  _onClickSubject(Subject subject) {
    print(subject.name);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubjectPage(subject)),
    );
  }
}
