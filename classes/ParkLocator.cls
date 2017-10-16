public class ParkLocator {
    public static String[] country(String cntry){
        ParkService.ParksImplPort ps = new ParkService.ParksImplPort();
        system.debug('Result: '+ ps.byCountry(cntry));
        return ps.byCountry(cntry);
    }
}