//
//  TWebApi.m
//  Chirag Lukhi
//
//  Created by Lanetteam on 9/7/12.
//  Copyright (c) 2012 HongYing Dev Group. All rights reserved.
//


#import "TWebApi.h"
#import "Reachability.h"
#import "CommonUtility.h"
@implementation TWebApi
@synthesize MethodName,Parameter;

-(TWebApi *) initWithFullApiName:(NSString *)fullApiName andAlias:(NSString *)apiAlias {
    NSString *_apiAlias;
    NSString *_fullApiName;
    if (apiAlias) _apiAlias = apiAlias;
    else _apiAlias = @"";
    
    if (fullApiName) _fullApiName = fullApiName;
    else _fullApiName = @"";
    
    m_apiAlias = [[NSString alloc] initWithString:_apiAlias];
    m_fullApiName = [[NSString alloc] initWithString:_fullApiName];
    return self;
}

-(void)runRawApiSuccessCallback:(SEL)successSelector strParameter:(NSString *)strParameter inDelegate:delegateObj {
    @try {
        
        if (m_data) {
            m_data = nil;
        }
        
        NSURL *_url = [NSURL URLWithString:[MethodName stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]]];
        NSMutableURLRequest *_request = [NSMutableURLRequest requestWithURL:_url];
        [_request setTimeoutInterval:60.0];
        [_request setValue:@"application/raw" forHTTPHeaderField:@"Content-Type"];
        
        // [_request addValue:@"text/plain; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [_request addValue:[[NSString alloc] initWithFormat:@"%lu",(unsigned long)[strParameter length]] forHTTPHeaderField:@"Content-length"];
        [_request setHTTPMethod:@"POST"];
        [_request setHTTPBody:[strParameter dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSString *netStr = [self checkNetworkConnectivity];
        if([netStr isEqualToString:@"NoAccess"])
        {
           // NSMutableDictionary *respData = [[NSMutableDictionary alloc] init];
           // [respData setObject:@"No Network Found!" forKey:@"data"];
//            [DejalBezelActivityView removeViewAnimated:YES];
//            [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
            
        }
        else
        {
            m_data = [[NSMutableData alloc] init];
            m_delegate = delegateObj;
            m_successCallback = successSelector;
            [self webserviceResponse:_request];
        }
    }
    @catch (NSException *exception) {
//        [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
//        [DejalBezelActivityView removeViewAnimated:YES];
    }
    @finally {
    }
    
}

-(void)runApiSuccessCallback:(SEL)successSelector inDelegate:delegateObj {
    @try {
        
        if (m_data) {
            m_data = nil;
        }
        NSURL *_url = [NSURL URLWithString:[MethodName stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]]];
        
        NSData *postData = [Parameter dataUsingEncoding:NSUTF8StringEncoding];
        NSMutableURLRequest *_request = [NSMutableURLRequest requestWithURL:_url];
        [_request setTimeoutInterval:60.0];
        [_request setHTTPMethod:@"POST"];
        [_request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Accept"];
        [_request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
     // [_request addValue:[[NSString alloc] initWithFormat:@"%lu",(unsigned long)[Parameter length]] forHTTPHeaderField:@"Content-length"];
        
       // [_request setValue:contentLength forHTTPHeaderField:@"Content-Length"];
       // [_request setValue:@"UTF-8" forHTTPHeaderField:@"Accept-Charset"];
        
        //[_request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        
        [_request setHTTPBody:postData];
        
        NSString *netStr = [self checkNetworkConnectivity];
        if([netStr isEqualToString:@"NoAccess"])
        {
           // NSMutableDictionary *respData = [[NSMutableDictionary alloc] init];
           // [respData setObject:@"No Network Found!" forKey:@"data"];
           // [DejalBezelActivityView removeViewAnimated:YES];
            //[CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
        }
        else
        {
            m_data = [[NSMutableData alloc] init];
            m_delegate = delegateObj;
            m_successCallback = successSelector;
            [self webserviceResponse:_request];
        }
    }
    @catch (NSException *exception) {
       // [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
       // [DejalBezelActivityView removeViewAnimated:YES];
    }
    @finally {
    }
    
}
-(void)GET_runApiSuccessCallback:(SEL)successSelector inDelegate:delegateObj {
    
    @try {
        if (m_data) {
            m_data = nil;
        }
        NSURL *_url = [NSURL URLWithString:[MethodName stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]]];
        NSMutableURLRequest *_request = [NSMutableURLRequest requestWithURL:_url];
        [_request setTimeoutInterval:60.0];
        [_request setHTTPMethod:@"GET"];
        NSString *netStr = [self checkNetworkConnectivity];
        if([netStr isEqualToString:@"NoAccess"])
        {
            //NSMutableDictionary *respData = [[NSMutableDictionary alloc] init];
           // [respData setObject:@"No Network Found!" forKey:@"data"];
            //[DejalBezelActivityView removeViewAnimated:YES];
           // [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
        }
        else
        {
            m_data = [[NSMutableData alloc] init];
            m_delegate = delegateObj;
            m_successCallback = successSelector;
            [self webserviceResponse:_request];

        }
    }
    @catch (NSException *exception) {
       // [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
        //[DejalBezelActivityView removeViewAnimated:YES];
    }
    @finally {
    }
}

-(void)ForImageUploding_runApiSuccessCallback:(SEL)successSelector  inDelegate:delegateObj WithImageParameter:(NSMutableDictionary *)Iparameter WithoutImageParameter:(NSMutableDictionary *)WIparameter strImageParameter:(NSString *)strImageParameter{
    @try {
        
        if (m_data) {
            m_data = nil;
        }
        NSURL *_url = [NSURL URLWithString:MethodName];
        NSMutableURLRequest *_request = [NSMutableURLRequest requestWithURL:_url];
        [_request setTimeoutInterval:60.0];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [_request addValue:contentType forHTTPHeaderField:@"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        for (NSString *key in WIparameter) {
            NSString *value = [WIparameter objectForKey:key];
            
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@",key, value] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
        }
        //        NSInteger i=0;
        //        for (NSString *key in Iparameter) {
        NSObject *value = [Iparameter objectForKey:strImageParameter];
        
        //Image
        //            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.png%d\"\r\n",key,i] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"photo\"; filename=\".png\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\".png\"\r\n",strImageParameter] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:(NSData *)value]];
        //            i++;
        //        }
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        //        NSLog(@"%@",body);
        
        //[_request addValue:[[NSString alloc] initWithFormat:@"%d",[body length]] forHTTPHeaderField:@"Content-Length"];
        [_request setHTTPMethod:@"POST"];
        [_request setHTTPBody:body];
        
        
        NSString *netStr = [self checkNetworkConnectivity];
        if([netStr isEqualToString:@"NoAccess"])
        {
            
           // NSMutableDictionary *respData = [[NSMutableDictionary alloc] init];
            //[respData setObject:@"No Network Found!" forKey:@"data"];
            
            //            NSLog(@"INTERNET CONNECTION NOT AVAILABLE");
           // [DejalBezelActivityView removeViewAnimated:YES];
           // [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
            
            //            [delegateObj performSelector:m_failCallback withObject:m_apiAlias withObject:respData];
        }
        else
        {
            m_data = [[NSMutableData alloc] init];
            m_delegate = delegateObj;
            m_successCallback = successSelector;
            [self webserviceResponse:_request];

        }
        
    }
    @catch (NSException *exception) {
        //        NSLog(@"ERROR IN ForImageUploding_runApiSuccessCallback WEBAPI");
       // [DejalBezelActivityView removeViewAnimated:YES];
       // [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
    }
    @finally {
    }
}

-(void)ForImageUploding_runApiSuccessCallback:(SEL)successSelector  inDelegate:delegateObj WithImageParameter:(NSMutableDictionary *)Iparameter WithoutImageParameter:(NSMutableDictionary *)WIparameter {
    @try {
        
        if (m_data) {
            m_data = nil;
        }
        NSURL *_url = [NSURL URLWithString:MethodName];
        NSMutableURLRequest *_request = [NSMutableURLRequest requestWithURL:_url];
        [_request setTimeoutInterval:60.0];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [_request addValue:contentType forHTTPHeaderField:@"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        for (NSString *key in WIparameter) {
            NSString *value = [WIparameter objectForKey:key];
            
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@",key, value] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
        }
        //        NSInteger i=0;
        //        for (NSString *key in Iparameter) {
        NSObject *value = [Iparameter objectForKey:@"image"];
        
        //Image
        //            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.png%d\"\r\n",key,i] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"photo\"; filename=\".png\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\".png\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:(NSData *)value]];
        //            i++;
        //        }
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        //        NSLog(@"%@",body);
        
        //[_request addValue:[[NSString alloc] initWithFormat:@"%d",[body length]] forHTTPHeaderField:@"Content-Length"];
        [_request setHTTPMethod:@"POST"];
        [_request setHTTPBody:body];
        
        
        NSString *netStr = [self checkNetworkConnectivity];
        if([netStr isEqualToString:@"NoAccess"])
        {
            
           // NSMutableDictionary *respData = [[NSMutableDictionary alloc] init];
           // [respData setObject:@"No Network Found!" forKey:@"data"];
            
            //            NSLog(@"INTERNET CONNECTION NOT AVAILABLE");
            //[DejalBezelActivityView removeViewAnimated:YES];
          //  [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
            
      
            
            
            
            //            [delegateObj performSelector:m_failCallback withObject:m_apiAlias withObject:respData];
        }
        else
        {
            m_data = [[NSMutableData alloc] init];
            m_delegate = delegateObj;
            m_successCallback = successSelector;
            [self webserviceResponse:_request];

        }
        
    }
    @catch (NSException *exception) {
        //        NSLog(@"ERROR IN ForImageUploding_runApiSuccessCallback WEBAPI");
       // [DejalBezelActivityView removeViewAnimated:YES];
       // [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
    }
    @finally {
    }
}


-(void)ForVideoUploding_runApiSuccessCallback:(SEL)successSelector  inDelegate:delegateObj WithImageParameter:(NSMutableDictionary *)Iparameter WithoutImageParameter:(NSMutableDictionary *)WIparameter strImageParameter:(NSString *)strImageParameter {
    @try {
        
        if (m_data) {
            m_data = nil;
        }
        NSURL *_url = [NSURL URLWithString:MethodName];
        NSMutableURLRequest *_request = [NSMutableURLRequest requestWithURL:_url];
        [_request setTimeoutInterval:60.0];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [_request addValue:contentType forHTTPHeaderField:@"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        for (NSString *key in WIparameter) {
            NSString *value = [WIparameter objectForKey:key];
            
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@",key, value] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
        }
        //        NSInteger i=0;
        //        for (NSString *key in Iparameter) {
        NSObject *value = [Iparameter objectForKey:strImageParameter];
        
        //Image
        //            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.png%d\"\r\n",key,i] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"photo\"; filename=\".png\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\".mp4\"\r\n",strImageParameter] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:(NSData *)value]];
        //            i++;
        //        }
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        //        NSLog(@"%@",body);
        
        //[_request addValue:[[NSString alloc] initWithFormat:@"%d",[body length]] forHTTPHeaderField:@"Content-Length"];
        [_request setHTTPMethod:@"POST"];
        [_request setHTTPBody:body];
        
        
        NSString *netStr = [self checkNetworkConnectivity];
        if([netStr isEqualToString:@"NoAccess"])
        {
            
           // NSMutableDictionary *respData = [[NSMutableDictionary alloc] init];
            //[respData setObject:@"No Network Found!" forKey:@"data"];
            
            //            NSLog(@"INTERNET CONNECTION NOT AVAILABLE");
           // [DejalBezelActivityView removeViewAnimated:YES];
           // [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
            
            //            [delegateObj performSelector:m_failCallback withObject:m_apiAlias withObject:respData];
        }
        else
        {
            m_data = [[NSMutableData alloc] init];
            m_delegate = delegateObj;
            m_successCallback = successSelector;
            [self webserviceResponse:_request];
            
        }
        
    }
    @catch (NSException *exception) {
        //        NSLog(@"ERROR IN ForImageUploding_runApiSuccessCallback WEBAPI");
       // [DejalBezelActivityView removeViewAnimated:YES];
       // [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
    }
    @finally {
    }
}

-(void) alloc {
    m_con = nil;
    m_successCallback = nil;
    m_failCallback = nil;
    m_apiAlias = nil;
    m_fullApiName = nil;
    m_delegate = nil;
    m_data = nil;
}

-(void)webserviceResponse:(NSMutableURLRequest *)_request
{
    NSURLSessionTask *task1 = [[NSURLSession sharedSession] dataTaskWithRequest:_request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                               {
                                   if (error)
                                   {
                                      
                                      
                                       dispatch_async(dispatch_get_main_queue(), ^{
                                          //  [DejalBezelActivityView removeViewAnimated:YES];
                                          // [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
                                       });
                                      //                                       if (!m_successCallback || !m_delegate) return;
                                       
                                   }else
                                   {
                                       @try {
                                           NSHTTPURLResponse *httpResponse = nil;
                                           if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                               httpResponse = (NSHTTPURLResponse *)response;
                                           }
                                           
                                           m_statusCode = [httpResponse statusCode];
                                           if ([httpResponse statusCode] == 1000) {
                                               m_error = NO;
                                           } else {
                                               m_error = YES;
                                           }
                                           [m_data appendData:data];
                                           if (!m_successCallback || !m_delegate) return;
                                           
                                           NSMutableDictionary *respData = [[NSMutableDictionary alloc] init];
                                           [respData setObject:[NSNumber numberWithInt:m_statusCode] forKey:@"code"];
                                           
                                           NSString* datastring = [[NSString alloc] initWithData:m_data
                                                                                        encoding:NSUTF8StringEncoding] ;
                                           
                                           [respData setObject:datastring forKey:@"data"];
                                           
                                           NSData* data = [[respData objectForKey:@"data"] dataUsingEncoding:NSUTF8StringEncoding];
                                           
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               if (!m_error) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                                                   [m_delegate performSelector:m_successCallback withObject:m_apiAlias withObject:data];
#pragma clang diagnostic pop
                                               } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                                                   [m_delegate performSelector:m_successCallback withObject:m_apiAlias withObject:data];
#pragma clang diagnostic pop
                                               }
                                           });
                                           
                                       }
                                       @catch (NSException *exception) {
                                           
//                                           dispatch_async(dispatch_get_main_queue(), ^{
////                                                [DejalBezelActivityView removeViewAnimated:YES];
//                                               [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
//                                           });
                                          
                                       }
                                       @finally {
                                           
                                       }                                   }
                               }];
    [task1 resume];
}
-(NSString *)checkNetworkConnectivity
{
    NSString *networkValue;
    Reachability *rc = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus internetStatus = [rc currentReachabilityStatus];
    
    if(internetStatus==0)
    {
        networkValue = @"NoAccess";
    }
    else if(internetStatus==1)
    {
        networkValue = @"ReachableViaWiFi";
        
    } else if(internetStatus==2)
    {
        networkValue = @"ReachableViaWWAN";
    }
    else  if(internetStatus>2)
    {
        networkValue = @"Reachable";
    }
    return networkValue;
}

-(void)ForPdfUploding_runApiSuccessCallback:(SEL)successSelector  inDelegate:delegateObj WithImageParameter:(NSMutableDictionary *)Iparameter WithoutImageParameter:(NSMutableDictionary *)WIparameter {
    @try {
        
        if (m_data) {
            m_data = nil;
        }
        NSURL *_url = [NSURL URLWithString:MethodName];
        NSMutableURLRequest *_request = [NSMutableURLRequest requestWithURL:_url];
        [_request setTimeoutInterval:239];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [_request addValue:contentType forHTTPHeaderField:@"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        for (NSString *key in WIparameter) {
            NSString *value = [WIparameter objectForKey:key];
            
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@",key, value] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
        }
        //        NSInteger i=0;
        //        for (NSString *key in Iparameter) {
        NSObject *value = [Iparameter objectForKey:@"image"];
        
        //Image
        //            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.png%d\"\r\n",key,i] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"photo\"; filename=\".png\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\".pdf\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:(NSData *)value]];
        //            i++;
        //        }
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        //        NSLog(@"%@",body);
        
        //[_request addValue:[[NSString alloc] initWithFormat:@"%d",[body length]] forHTTPHeaderField:@"Content-Length"];
        [_request setHTTPMethod:@"POST"];
        [_request setHTTPBody:body];
        
        
        NSString *netStr = [self checkNetworkConnectivity];
        if([netStr isEqualToString:@"NoAccess"])
        {
            
           // NSMutableDictionary *respData = [[NSMutableDictionary alloc] init];
            //[respData setObject:@"No Network Found!" forKey:@"data"];
            
            //            NSLog(@"INTERNET CONNECTION NOT AVAILABLE");
           // [DejalBezelActivityView removeViewAnimated:YES];
           // [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
            
            //            [delegateObj performSelector:m_failCallback withObject:m_apiAlias withObject:respData];
        }
        else
        {
            m_data = [[NSMutableData alloc] init];
            m_delegate = delegateObj;
            m_successCallback = successSelector;
            [self webserviceResponse:_request];
            
        }
        
    }
    @catch (NSException *exception) {
        //        NSLog(@"ERROR IN ForImageUploding_runApiSuccessCallback WEBAPI");
       // [DejalBezelActivityView removeViewAnimated:YES];
       // [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
    }
    @finally {
    }
}


-(void)ForCsvUploding_runApiSuccessCallback:(SEL)successSelector  inDelegate:delegateObj WithImageParameter:(NSMutableDictionary *)Iparameter WithoutImageParameter:(NSMutableDictionary *)WIparameter {
    @try {
        
        if (m_data) {
            m_data = nil;
        }
        NSURL *_url = [NSURL URLWithString:MethodName];
        NSMutableURLRequest *_request = [NSMutableURLRequest requestWithURL:_url];
        [_request setTimeoutInterval:60.0];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [_request addValue:contentType forHTTPHeaderField:@"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        for (NSString *key in WIparameter) {
            NSString *value = [WIparameter objectForKey:key];
            
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@",key, value] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
        }
        //        NSInteger i=0;
        //        for (NSString *key in Iparameter) {
        NSObject *value = [Iparameter objectForKey:@"image"];
        
        //Image
        //            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.png%d\"\r\n",key,i] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"photo\"; filename=\".png\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\".csv\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:(NSData *)value]];
        //            i++;
        //        }
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        //        NSLog(@"%@",body);
        
        //[_request addValue:[[NSString alloc] initWithFormat:@"%d",[body length]] forHTTPHeaderField:@"Content-Length"];
        [_request setHTTPMethod:@"POST"];
        [_request setHTTPBody:body];
        
        NSString *netStr = [self checkNetworkConnectivity];
        if([netStr isEqualToString:@"NoAccess"])
        {
            
            //NSMutableDictionary *respData = [[NSMutableDictionary alloc] init];
            //[respData setObject:@"No Network Found!" forKey:@"data"];
            
            //            NSLog(@"INTERNET CONNECTION NOT AVAILABLE");
           // [DejalBezelActivityView removeViewAnimated:YES];
            //[CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
            
            //            [delegateObj performSelector:m_failCallback withObject:m_apiAlias withObject:respData];
        }
        else
        {
            m_data = [[NSMutableData alloc] init];
            m_delegate = delegateObj;
            m_successCallback = successSelector;
            [self webserviceResponse:_request];
        }
    }
    @catch (NSException *exception)
    {
        //        NSLog(@"ERROR IN ForImageUploding_runApiSuccessCallback WEBAPI");
       // [DejalBezelActivityView removeViewAnimated:YES];
       // [CommonUtility showMessage:@"Internet connection not available" withTitle:@"Message"];
    }
    @finally {
    }
}

@end
