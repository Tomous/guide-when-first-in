
//NSUserDefaults只支持： NSString, NSNumber, NSDate, NSArray, NSDictionary.
inline static id UserDefault(id object,NSString *key)
{
    NSUserDefaults *objud;
    if ([key isEqualToString:@"main"]) {
        objud = [[NSUserDefaults alloc]initWithSuiteName:@"main"];
    }else
        objud = [NSUserDefaults standardUserDefaults];
    if (object) {
        @try {
            [objud setObject:object forKey:key];
            [objud synchronize];
        }
        @catch (NSException *exception) {
            NSLog(@"%@", exception);
        }
        @finally {
            
        }
        return nil;
    }else
        return [objud objectForKey:key];
}

inline static id UserNameDefault(NSObject *object,NSString *key, NSString* username)
{
    NSUserDefaults *objud = [[NSUserDefaults alloc] initWithSuiteName:username];
    
    
    if (object ) {
        @try {
            
            
            [objud setObject:object forKey:key];
            [objud synchronize];
        }
        @catch (NSException *exception) {
            NSLog(@"%@", exception);
        }
        @finally {
            
        }
        return nil;
    }else
        return [objud objectForKey:key];
}
