//
//  CameraViewController.swift
//  RefinedDoggo
//
//  Created by Neha Kunjal on 12/16/17.
//  Copyright © 2017 Neha Kunjal. All rights reserved.
//
import AVFoundation
import UIKit

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    let captureSession = AVCaptureSession()
    var videoPreviewLayer: CALayer!
    var captureDevice: AVCaptureDevice!
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCamera()
        // Do any additional setup after loading the view.
    }

    func prepareCamera() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.back).devices
        captureDevice = availableDevices.first
        beginSession()
    }
    func beginSession() {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(captureDeviceInput)
        } catch {
            print("Error in the begin session method")
            print(error.localizedDescription)
        }
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.videoPreviewLayer = previewLayer
        self.view.layer.addSublayer(self.videoPreviewLayer)
        self.videoPreviewLayer.frame = self.view.layer.frame
        captureSession.startRunning()
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.videoSettings = [((kCVPixelBufferPixelFormatTypeKey as NSString) as String): NSNumber(value: kCVPixelFormatType_32BGRA)]
        dataOutput.alwaysDiscardsLateVideoFrames = true
        if captureSession.canAddOutput(dataOutput) {
            captureSession.addOutput(dataOutput)
        }
        captureSession.commitConfiguration()
        let queue = DispatchQueue(label: "com.bestFriends")
        dataOutput.setSampleBufferDelegate(self, queue: queue)
    }
    var photoTaken = false
    @IBAction func takePhoto(_ sender: Any) {
        photoTaken = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PhotoViewController
        destination.takenPhoto = sender as? UIImage
        
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if photoTaken {
            photoTaken = false
            if let image = self.getSampleBufferImage(buffer: sampleBuffer) {
                self.performSegue(withIdentifier: "photoTakenID", sender: image)
                //self.present(photoVC, animated: true, completion: nil)
            }
        }
        
    }
    func getSampleBufferImage(buffer: CMSampleBuffer) ->UIImage? {
        if let pixelBuffer = CMSampleBufferGetImageBuffer(buffer) {
            let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
            let context = CIContext()
            let imageRect = CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(pixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer))
            if  let image = context.createCGImage(ciImage, from: imageRect) {
                return UIImage(cgImage: image, scale: UIScreen.main.scale, orientation: .right)
            }
        }
        return nil
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
