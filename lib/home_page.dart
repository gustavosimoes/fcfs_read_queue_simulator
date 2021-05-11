import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trabalho_threads/home_controller.dart';

class HomePage extends StatelessWidget {
  FcfsController controller = FcfsController();

  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
        appBar: AppBar(title: Text('FCFS')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                width: 150,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.processesVisitedName.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Column(
                        children: [
                          SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.blue[600],
                            ),
                            height: 50,
                            width: 50,
                            child: Center(
                              child: Text(
                                controller.processesVisitedName[i],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            Obx(
              () => Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Tempo',
                    style: TextStyle(fontSize: 50),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.red[600],
                    ),
                    height: 150,
                    width: 150,
                    child: Stack(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.timer,
                            color: Colors.white,
                          ),
                        ),
                        Center(
                          child: Text(
                            controller?.timer?.value.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 75),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Processo\nAtual',
                    style: TextStyle(fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.green[600],
                    ),
                    height: 150,
                    width: 150,
                    child: Stack(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.keyboard_tab_sharp,
                            color: Colors.white,
                          ),
                        ),
                        Center(
                          child: Text(
                            controller?.actualProcess?.value?.name == null
                                ? ''
                                : controller.actualProcess.value.name,
                            style: TextStyle(color: Colors.white, fontSize: 75),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: new TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text: '${controller.processes[0].name}: '),
                          new TextSpan(
                              text: controller?.processes[0]?.waitingTime ==
                                      null
                                  ? ''
                                  : '${controller?.processes[0]?.waitingTime}',
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: new TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text: '${controller.processes[1].name}: '),
                          new TextSpan(
                              text: controller?.processes[1]?.waitingTime ==
                                      null
                                  ? ''
                                  : '${controller?.processes[1]?.waitingTime}',
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: new TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text: '${controller.processes[2].name}: '),
                          new TextSpan(
                              text: controller?.processes[2]?.waitingTime ==
                                      null
                                  ? ''
                                  : '${controller?.processes[2]?.waitingTime}',
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: new TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text: '${controller.processes[3].name}: '),
                          new TextSpan(
                              text: controller?.processes[3]?.waitingTime ==
                                      null
                                  ? ''
                                  : '${controller?.processes[3]?.waitingTime}',
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Tempo de espera\nmédio: ${controller.getAverageWaitingTime()}',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
