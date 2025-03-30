import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

// Separate enum declaration outside the class
enum FilePickerFileType {
  image,
  video,
  audio,
  pdf,
  custom,
  any
}

class FilePickerHelper {
  /// Check and request storage permissions
  static Future<bool> _checkStoragePermission() async {
    // For Android, we need to request storage permissions
    if (Platform.isAndroid) {
      // Check current permission status
      var status = await Permission.storage.status;

      // If not granted, request permission
      if (!status.isGranted) {
        status = await Permission.storage.request();
      }

      // If still not granted, return false
      if (!status.isGranted) {
        debugPrint('Storage permission denied');
        return false;
      }
    }

    // For iOS and other platforms, or if Android permission is granted
    return true;
  }

  /// Pick a single file with permission handling
  static Future<File?> pickSingleFile({
    FilePickerFileType type = FilePickerFileType.any,
    List<String>? allowedExtensions,
    int? maxSizeInMB,
  }) async {
    try {
      // Check storage permissions first
      if (!await _checkStoragePermission()) {
        debugPrint('Storage permission not granted');
        return null;
      }

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: _mapFileType(type),
        allowedExtensions: _getAllowedExtensions(type, allowedExtensions),
        allowCompression: true,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        File file = File(result.files.single.path!);

        // Validate file size if maxSizeInMB is specified
        if (maxSizeInMB != null) {
          int fileSizeInBytes = await file.length();
          if (fileSizeInBytes > (maxSizeInMB * 1024 * 1024)) {
            throw 'File size exceeds maximum limit of ${maxSizeInMB}MB';
          }
        }

        return file;
      }
      return null;
    } catch (e) {
      debugPrint('File Pick Error: $e');
      return null;
    }
  }

  /// Pick multiple files with permission handling
  static Future<List<File>> pickMultipleFiles({
    FilePickerFileType type = FilePickerFileType.any,
    List<String>? allowedExtensions,
    int? maxSizeInMB,
  }) async {
    try {
      // Check storage permissions first
      if (!await _checkStoragePermission()) {
        debugPrint('Storage permission not granted');
        return [];
      }

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: _mapFileType(type),
        allowedExtensions: _getAllowedExtensions(type, allowedExtensions),
        allowCompression: true,
        allowMultiple: true,
      );

      if (result != null && result.files.isNotEmpty) {
        // Convert file paths to list of Future<File> with size filtering
        List<Future<File?>> fileFutures = result.files.map((file) async {
          File currentFile = File(file.path!);

          // Check file size if maxSizeInMB is specified
          if (maxSizeInMB != null) {
            int fileSizeInBytes = await currentFile.length();
            if (fileSizeInBytes <= (maxSizeInMB * 1024 * 1024)) {
              return currentFile;
            }
            return null;
          }

          return currentFile;
        }).toList();

        // Wait for all futures and filter out nulls
        return (await Future.wait(fileFutures)).whereType<File>().toList();
      }
      return [];
    } catch (e) {
      debugPrint('Multiple Files Pick Error: $e');
      return [];
    }
  }

  /// Pick files from a specific directory with permission handling
  static Future<List<File>> pickFilesFromDirectory({
    FilePickerFileType type = FilePickerFileType.any,
    List<String>? allowedExtensions,
  }) async {
    try {
      // Check storage permissions first
      if (!await _checkStoragePermission()) {
        debugPrint('Storage permission not granted');
        return [];
      }

      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory != null) {
        Directory directory = Directory(selectedDirectory);

        // Check if directory exists and is readable
        if (!await directory.exists()) {
          debugPrint('Selected directory does not exist');
          return [];
        }

        try {
          return directory.listSync()
              .where((entity) => entity is File)
              .map((entity) => entity as File)
              .where((file) {
            // Filter by file type and extensions
            String extension = file.path.split('.').last.toLowerCase();
            return _matchesFileType(file, type, allowedExtensions);
          })
              .toList();
        } on FileSystemException catch (e) {
          debugPrint('Error reading directory: ${e.message}');
          return [];
        }
      }
      return [];
    } catch (e) {
      debugPrint('Directory File Pick Error: $e');
      return [];
    }
  }

  /// Utility method to open a specific file
  static Future<bool> openFile(File file) async {
    try {
      // You might want to use a plugin like open_file for this
      // This is a placeholder implementation
      if (await file.exists()) {
        // Implement file opening logic
        debugPrint('Opening file: ${file.path}');
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Error opening file: $e');
      return false;
    }
  }

  /// Internal method to map FileType to FilePicker's FileType
  static FileType _mapFileType(FilePickerFileType type) {
    switch (type) {
      case FilePickerFileType.image:
        return FileType.image;
      case FilePickerFileType.video:
        return FileType.video;
      case FilePickerFileType.audio:
        return FileType.audio;
      case FilePickerFileType.pdf:
        return FileType.custom;
      case FilePickerFileType.custom:
        return FileType.custom;
      case FilePickerFileType.any:
      default:
        return FileType.any;
    }
  }

  /// Internal method to get allowed extensions
  static List<String>? _getAllowedExtensions(FilePickerFileType type, List<String>? customExtensions) {
    if (customExtensions != null) return customExtensions;

    switch (type) {
      case FilePickerFileType.image:
        return ['jpg', 'jpeg', 'png', 'gif', 'webp'];
      case FilePickerFileType.video:
        return ['mp4', 'avi', 'mov', 'wmv', 'flv'];
      case FilePickerFileType.audio:
        return ['mp3', 'wav', 'ogg', 'aac'];
      case FilePickerFileType.pdf:
        return ['pdf', 'doc', 'docx', 'txt', 'rtf'];
      case FilePickerFileType.custom:
      case FilePickerFileType.any:
      default:
        return null;
    }
  }

  /// Check if file matches the specified type and extensions
  static bool _matchesFileType(File file, FilePickerFileType type, List<String>? allowedExtensions) {
    String extension = file.path.split('.').last.toLowerCase();

    if (allowedExtensions != null) {
      return allowedExtensions.contains(extension);
    }

    switch (type) {
      case FilePickerFileType.image:
        return ['jpg', 'jpeg', 'png', 'gif', 'webp'].contains(extension);
      case FilePickerFileType.video:
        return ['mp4', 'avi', 'mov', 'wmv', 'flv'].contains(extension);
      case FilePickerFileType.audio:
        return ['mp3', 'wav', 'ogg', 'aac'].contains(extension);
      case FilePickerFileType.pdf:
        return ['pdf', 'doc', 'docx', 'txt', 'rtf'].contains(extension);
      case FilePickerFileType.custom:
      case FilePickerFileType.any:
      default:
        return true;
    }
  }
}