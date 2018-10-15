# Integrating React Native with Native

<code>integrating-rn-with-native</code> is a sample showing how react-native works with native module/application. 

### React Native to iOS Framework

Official docs: [Integration with Existing Apps -- iOS](http://facebook.github.io/react-native/docs/integration-with-existing-apps)

#### Step

1. Build react native projects to a **jsbundle** file

2. Add jsbundle file to the iOS project and write codes to load it, like

   ```objective-c
   // Attention that NOT "mainBundle" in this context because we will include it in the framework rather than host project.
   NSURL *jsCodeLocation = [[NSBundle bundleForClass:self.class] URLForResource:@"main" withExtension:@"jsbundle"];
   
   RCTRootView *rootView = [[RCTRootView alloc] 
     initWithBundleURL:jsCodeLocation
     moduleName:@"MyReactNativeApp"
     initialProperties: @{ @"content" : @"hello" }
     launchOptions:nil
   ];
   ```

3. Pod the react native dependencies into iOS project as the official tutorial does

4. Build the framework!

#### Size Evaluation

The framework size is approximately **7.5MB** when it is a extremely simple project.

- app initial size: **51KB**
- app integrating react-native size: **7.5MB**

#### Screenshot

<img src="https://i.loli.net/2018/10/15/5bc4574a72dfe.gif" style="width:250px; align:left;" />



### React Native to Android Library (Maven)

Official docs: [Integration with Existing Apps -- Android](http://facebook.github.io/react-native/docs/integration-with-existing-apps)

#### Step

1. Create the project following official tutorial. http://facebook.github.io/react-native/docs/integration-with-existing-apps

2. Upload the react-native android artifacts to your private maven repository (for example, via Azure Artifacts, following this tutorial: <https://docs.microsoft.com/en-us/azure/devops/artifacts/get-started-maven?view=vsts&tabs=new-nav#install-an-artifact-from-your-feed>) manually

   PS: This is because the official react-native maven is no longer actively updated. (see https://mvnrepository.com/artifact/com.facebook.react/react-native ) And you can do this with a script as shown in <code>native-with-rn/publish-react-native-maven.sh</code>

3. Import the dependency of react native that you just uploaded

4. Publish your library to private maven repository

5. Import your library

6. Add these codes in host app to [avoid mixing 32/64 bit dependencies issues](https://corbt.com/posts/2015/09/18/mixing-32-and-64bit-dependencies-in-android.html)

   add <code>android.useDeprecatedNdk=true</code> to host app's gradle.properties

   add

   ```
   android {    
     ...
     defaultConfig {        
       ...  
       ndk { 
           abiFilters "armeabi-v7a", "x86"     
        }  
     }    
     ...
    packagingOptions {    
       exclude "lib/arm64-v8a/librealm-jni.so" 
      }
   ...
   }
   ```

   to host app's build.gradle

7. Run your host app!

#### Size Evaluation

- app initial size: **1.5MB** (release)
- app integrating rn size: **7.8MB** (release)

#### Screenshot

<img src="https://i.loli.net/2018/10/15/5bc4574a72dfe.gif" style="width:250px; align:left;" />



### Build to npm package

Official docs: 

- [Native Modules Android](http://facebook.github.io/react-native/docs/native-modules-android)

- [Native Modules iOS](http://facebook.github.io/react-native/docs/native-modules-ios)

#### Step

1. Follow the offcial docs to create your react-native projects and add the native modules
2. Connect to the feed and publish the package there
3. See the demo if you're confused about this

#### Screenshot

<img src="https://i.loli.net/2018/10/15/5bc458c152a3c.jpg" style="width:250px; align:left;" />


