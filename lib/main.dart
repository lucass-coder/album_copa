import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/config/env/env.dart';
import 'package:fwc_album_app/fwc_algum_app.dart';

void main() async {
  await Env.i.load();
  runApp(const FwcAlgumApp());
}
