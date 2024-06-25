import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';

class AppQrScanner extends StatefulWidget {
  Function(String) onQrScan;
  Function(QRViewController) onViewCreated;
  QRViewController? controller;

  AppQrScanner(
      {super.key,
      required this.onQrScan,
      required this.onViewCreated,
      required this.controller});

  @override
  State<AppQrScanner> createState() => _AppQrScannerState();
}

class _AppQrScannerState extends State<AppQrScanner> {
  Barcode? result;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  io.File? _image;
  final picker = ImagePicker();
  bool isFlashOn = false;
  void barcode({required String qrResult, required String message}) {}

  Future<void> _onQRViewCreated(QRViewController controller) async {
    widget.controller = controller;
    widget.onViewCreated(controller);
    //This code fixes the issue with the camera that displaying a black screen
    widget.controller!.pauseCamera();
    widget.controller!.resumeCamera();
    widget.controller!.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        widget.onQrScan.call(scanData.code.toString());
        return;
      }
    });
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = io.File(pickedFile.path);

      final result = await Scan.parse(_image!.path);

      if (mounted) {
        widget.onQrScan(result ?? ''.toString());
      }
    }
  }

  Future<void> flashLight() async {
    try {
      await widget.controller!.toggleFlash();
      setState(() {
        isFlashOn = !isFlashOn;
      });
    } catch (e) {
      return;
    }
  }

  @override
  void dispose() {
    widget.controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Theme.of(context).primaryColor,
              borderRadius: 10.r,
              borderLength: 30.h,
              borderWidth: 10.w,
              cutOutSize: 300.r,
            ),
          ),
        ),
        Positioned(
          bottom: 0.h,
          right: 0.h,
          child: IconButton(
              onPressed: pickImage,
              icon: Icon(
                Icons.photo_library_sharp,
                color: Colors.white,
                size: 25.w,
              )),
        ),
        Positioned(
          bottom: 0.h,
          left: 0.h,
          child: IconButton(
              onPressed: flashLight,
              icon: Icon(
                isFlashOn ? Icons.flash_on : Icons.flash_off,
                color: Colors.white,
                size: 25.w,
              )),
        ),
      ],
    );
  }
}
