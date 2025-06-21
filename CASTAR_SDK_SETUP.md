# CastarSDK Integration Setup Guide

## Prerequisites
- iOS 12.0+
- Xcode 15.3+
- CastarSDK.framework file

## Step 1: Download CastarSDK
1. Go to the CastarSDK website
2. Download the iOS SDK (CastarSDK.framework)
3. Extract the downloaded file

## Step 2: Add CastarSDK.framework to Xcode Project
1. Open the project in Xcode: `ios/Runner.xcworkspace`
2. Right-click on the Runner project in the navigator
3. Select "Add Files to Runner"
4. Navigate to and select the `CastarSDK.framework` file
5. Make sure "Copy items if needed" is checked
6. Click "Add"

## Step 3: Configure Framework Settings
1. Select the Runner project in Xcode
2. Select the Runner target
3. Go to "General" tab
4. Scroll down to "Frameworks, Libraries, and Embedded Content"
5. Find `CastarSDK.framework` in the list
6. Set the "Embed" option to "Embed & Sign"

## Step 4: Update iOS Deployment Target
1. Select the Runner project in Xcode
2. Select the Runner target
3. Go to "General" tab
4. Set "Deployment Target" to iOS 12.0 or higher

## Step 5: Build and Test
1. Clean the build folder (Product → Clean Build Folder)
2. Build the project (Product → Build)
3. Run the app on a device or simulator

## Troubleshooting
- If you get build errors, make sure the framework is properly embedded
- Verify that the iOS deployment target is set to 12.0+
- Check that the CastarSDK.framework is added to the correct target

## Usage in App
1. Enter your CastarSDK Client ID in the app
2. Click "Initialize CastarSDK" to set up the SDK
3. Click "Start CastarSDK" to begin monetization
4. Click "Stop CastarSDK" to stop when needed

## Note
- The CastarSDK will start generating revenue after 48 hours
- Make sure to test the integration thoroughly before releasing
- Monitor your CastarSDK dashboard for revenue data 