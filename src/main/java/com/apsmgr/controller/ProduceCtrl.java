package com.apsmgr.controller;


import com.alibaba.fastjson.JSON;
import com.apsmgr.bo.ProduceBo;
import com.apsmgr.service.ProduceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/produce")
public class ProduceCtrl extends BaseCtrl {

    @Autowired
    private ProduceService produceService;

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insertProduce(ProduceBo produceBo) {
        produceService.insert(produceBo);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void deleteBatchProduce(@RequestParam("list")List<String> produceNoList) {
        int result = produceService.deleteBatch(produceNoList);
        return;
    }

    @RequestMapping(value = "/selectAll", method = RequestMethod.GET)
    public void selectAllProduce(HttpServletResponse response) throws Exception {
        List<ProduceBo> produceBoList = produceService.selectAllProduce();
        write(response, JSON.toJSONString(produceBoList));
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void updateProduce(ProduceBo produceBo, HttpServletResponse response) throws Exception {
        produceService.update(produceBo);
        return;
    }
}
