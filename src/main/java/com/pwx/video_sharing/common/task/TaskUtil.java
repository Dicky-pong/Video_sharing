package com.pwx.video_sharing.common.task;
/*package com.zhlt.business.union.cms.common.task;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.zhlt.business.union.cms.mobileShop.entity.Order;
import com.zhlt.business.union.cms.mobileShop.service.OrderService;

*//**
 * <定时器工具类>
 * 
 * @version <pre>
 * Author	Version		Date		Changes
 * liunengran 	1.0  		2015年12月18日 	Created
 *
 * </pre>
 * @since 1.
 *//*
@Component("taskUtil")
public class TaskUtil {

    private static Logger logger = Logger.getLogger(TaskUtil.class);
    @Resource
    private OrderService  orderService;

    *//**
     * 订单收货之后 定时结算 每天凌晨执行一次
     *//*
    @Scheduled(cron = "59 59 23 * * ?")
    public void clearingOrder() {
        List<Order> ords = orderService.findClearingOrder();
        for (Order ord : ords) {
            try {
                orderService.doClearing(ord.getOrdId().toString());
                Thread.sleep(1000);
            } catch (Exception e) {
                logger.error("自动结算-订单号:"+ord.getCode()+this.getClass(), e);
            }
           
        }
    }
    *//**
     * 订单发货七天之后自动收货    每天凌晨执行一次
     *//*
    @Scheduled(cron = "0 0 1 * * ?")
    public void receiveOrder() {
        List<Order> ords = orderService.findReceiveOrder();
        for (Order ord : ords) {
            try {
                orderService.doReceiveOrd(ord.getOrdId().toString());
                //Thread.sleep(1000);
            } catch (Exception e) {
                logger.error("自动确认收货-订单号:"+ord.getCode()+this.getClass(), e);
            }
           
        }
    }
    *//**
     * 下单后一天没有付款 自动删除    每天凌晨执行一次
     *//*
    @Scheduled(cron = "0 0 2 * * ?")
    public void deleteOrder() {
        try {
            orderService.doDelOrder();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(this.getClass(), e);
        }
       
    }
}
*/