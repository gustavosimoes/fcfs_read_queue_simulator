import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FcfsController extends GetxController {
  RxList<Process> processes = <Process>[].obs;
  RxList<String> processesVisitedName = <String>[].obs;
  RxInt timer = 0.obs;
  RxBool loading = false.obs;
  int timerTotal = 0;

  Rx<Process> actualProcess =
      Process(arrivalTime: null, burstTime: null, name: null).obs;

  init() {
    loading.value = true;
    initListProcesses();
    initTimerValue();
    timerAction();
  }

  randomBrustTime() {
    final Random r = Random();
    int brustTime = 0;
    while (brustTime == 0) {
      brustTime = r.nextInt(4);
    }
    return brustTime;
  }

  initListProcesses() {
    final Random r = Random();
    for (var i = 0; i < 4; i++) {
      Process p = Process(
        name: 'P${i + 1}',
        arrivalTime: r.nextInt(5),
        burstTime: randomBrustTime(),
      );
      processes.add(p);
    }

    processes.sort((a, b) => a.arrivalTime.compareTo(b.arrivalTime));
  }

  initTimerValue() {
    processes.map((element) {
      this.timerTotal += element.burstTime;
    }).toList();
  }

  timerAction() async {
    int timeTemp = 0;
    bool newBrushTime = true;
    int index = 0;
    for (int i = 0; i <= timerTotal; i++) {
      await Future.delayed(Duration(
        seconds: 1,
      ));
      timer.value = i;
      if (actualProcess?.value?.name == null) {
        actualProcess.value = processes.firstWhere(
            (element) => element.arrivalTime == i,
            orElse: () => null);
        actualProcess?.value?.setWaitingtime(i);
      } else {
        if (newBrushTime) {
          timeTemp = actualProcess.value.burstTime - 1;
          newBrushTime = false;
        }
        if (timeTemp == 0) {
          index++;
          if (index == 4) {
            actualProcess.value =
                Process(arrivalTime: 0, burstTime: 0, name: 'Fim');
            loading.value = false;
            break;
          }
          actualProcess.value = processes[index];
          actualProcess?.value?.setWaitingtime(i);
          newBrushTime = true;
        } else {
          timeTemp--;
        }
      }
      if (actualProcess?.value?.name != null) {
        processesVisitedName.add(actualProcess?.value?.name);
      }
    }
  }

  getAverageWaitingTime() {
    if (!loading.value) {
      double tempoMedio = 0;
      processes.map((element) => tempoMedio += element.waitingTime).toList();
      return (tempoMedio / processes.length).toString();
    }
    return '';
  }
}

class Process {
  final int arrivalTime;
  final int burstTime;
  final String name;
  int waitingTime = 0;

  Process({
    @required this.arrivalTime,
    @required this.burstTime,
    @required this.name,
    this.waitingTime,
  });

  void setWaitingtime(i) {
    this.waitingTime = i;
  }

  String toString() {
    return 'arrivalTime: $arrivalTime, burstTime: $burstTime, name: $name';
  }
}
