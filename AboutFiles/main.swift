//
//  main.swift
//  AboutFiles
//
//  Created by Josué V. Herrera on 10/4/16.
//  Copyright © 2016 KodigoSwift. All rights reserved.
//

import Foundation

// --- Creando un Archivo ---

print() // Añadiendo un espacio para mejorar la lecura!

let sourcePath = URL(fileURLWithPath: "/Volumes/Storage", isDirectory: true)
let destinationPath = URL(fileURLWithPath: "/Users/josuevhn/Documents", isDirectory: true)

let someFile: URL = URL(fileURLWithPath: "test.txt", relativeTo: sourcePath)

let stringLine: String = "Datos de ejemplo a añadir al archivo!"

let dataToFile: Data = stringLine.data(using: String.Encoding.utf8)!

let fileManager = FileManager.default

fileManager.createFile(atPath: someFile.path, contents: dataToFile, attributes: nil)

if fileManager.fileExists(atPath: someFile.path) {
    
    print("El archivo existe")

} else {
    
    print("Archivo no encontrado")

} // else


// --- Es ejecutable? ---

print() // Añadiendo un espacio para mejorar la lecura!

if fileManager.isExecutableFile(atPath: someFile.path) {
    
    print("El archivo es ejecutable")

} else {
    
    print("El archivo no es ejecutable")

} // else


// --- Es modificable? ---

print() // Añadiendo un espacio para mejorar la lecura!

if fileManager.isWritableFile(atPath: someFile.path) {
    
    print("File is writable")
    
} else {
    
    print("File is read-only")
    
} // else


// ---- Copiando y moviendo un archivo ---

print() // Añadiendo un espacio para mejorar la lecura!

// Copiando un archivo

do {
    
    try fileManager.copyItem(atPath: someFile.path, toPath: destinationPath.appendingPathComponent("anotherTest.txt").path)
    
    print("Copiando \(someFile.path) --> \(destinationPath.path)")
    
} catch let error as NSError {
    
    print("Ooops! Ha ocurrido un error: \(error)")
    
} // catch

// Moviendo un archivo

do {
    
    try fileManager.moveItem(atPath: someFile.path, toPath: destinationPath.appendingPathComponent("test.txt").path)
    
    print("Moviendo \(someFile.path) --> \(destinationPath.path)")
    
} catch let error as NSError {
    
    print("Ooops! Ha ocurrido un error: \(error)")
    
} // catch


// --- Atributos de los archivos ---

print() // Añadiendo un espacio para mejorar la lecura!


do {
    
    let attributes = try fileManager.attributesOfItem(atPath: someFile.path)
    
    print("\nMostrando los atributos del archivo: \(someFile.path)\n")
    
    for (attributeKey, attributeValue) in attributes {
        
        print("Atributo: \(attributeKey) con valor: \(attributeValue)")
        
    } // for
    
} catch let error as NSError {
    
    print("Ooops! Ha ocurrido un error: \(error)")
    
} // catch


// --- Eliminando un archivo ---

print() // Añadiendo un espacio para mejorar la lecura!


do {
    
    try fileManager.removeItem(atPath: destinationPath.appendingPathComponent("anotherTest.txt").path)
    
    print("Eliminando archivo \(destinationPath.appendingPathComponent("anotherTest.txt").path)")
    
} catch let error as NSError {
    
    print("Ooops! Ha ocurrido un error: \(error)")
    
} // catch


// --- Creando una carpeta ---

print() // Añadiendo un espacio para mejorar la lecura!


do {
    
    try fileManager.createDirectory(atPath: destinationPath.appendingPathComponent("NewFolder", isDirectory: true).path, withIntermediateDirectories: true, attributes: nil)
    
    print("Creando directorio \(destinationPath.path)/NewFolder")
    
} catch let error as NSError {
    
    print("Ooops! Ha ocurrido un error: \(error)")
    
} // catch


// --- Eliminando una carpeta ---

print() // Añadiendo un espacio para mejorar la lecura!


do {
    
    try fileManager.removeItem(atPath: destinationPath.appendingPathComponent("NewFolder", isDirectory: true).path)
    
    print("Eliminando directorio \(destinationPath.path)/NewFolder")
    
} catch let error as NSError {
    
    print("Ooops! Ha ocurrido un error: \(error)")
    
} // catch


// --- Obtener directorio actual ---

print() // Añadiendo un espacio para mejorar la lecura!


let path = fileManager.currentDirectoryPath

print("Directorio actual: \(path)")


// --- El contenido de una carpeta ---

print() // Añadiendo un espacio para mejorar la lecura!

do {
    
    let files = try fileManager.contentsOfDirectory(atPath: sourcePath.path)
    
    print("\nMostrando el contenido de la carpeta: \(sourcePath.path)\n")
    
    for var content in files {
        
        print(content)
        
    } // for
    
} catch let error as NSError {
    
    print("Ooops! Ha ocurrido un error: \(error)")
    
}// catch


// --- Directorio temporal ---

print() // Añadiendo un espacio para mejorar la lecura!


let temporalPath = NSTemporaryDirectory() as String

print(temporalPath)


// --- Leyendo un archivo ---

print() // Añadiendo un espacio para mejorar la lecura!


let file: FileHandle? = FileHandle(forReadingAtPath: sourcePath.appendingPathComponent("texto-a-leer.txt").path)

if file != nil {
    
    let data = file?.readDataToEndOfFile()
    
    file?.closeFile()
    
    let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
    
    print(str!)
    
} else {
    
    print("Ooops! Ha ocurrido un error!")
    
} // else


// --- Escribir hacia un archivo ---

print() // Añadiendo un espacio para mejorar la lecura!


let readingFromFile: FileHandle? = FileHandle(forReadingAtPath: sourcePath.appendingPathComponent("texto-a-leer.txt").path)
let writingToFile: FileHandle? = FileHandle(forWritingAtPath: sourcePath.appendingPathComponent("texto-a-escribir.txt").path)

var data: Data?

if readingFromFile != nil {
    
    data = readingFromFile?.readDataToEndOfFile()
    
    readingFromFile?.closeFile()
    
    let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
    
    print(str!)
    
} else {
    
    print("Ooops! Ha ocurrido un error al intentar abrir el archivo!")
    
} // else

if writingToFile != nil {
    
    writingToFile?.write(data!)
    
    writingToFile?.closeFile()
    
} else {
    
    print("Ooops! Ha ocurrido un error escribiendo hacia el archivo!")
    
} // else

// --- Escribir hacia un archivo ---
