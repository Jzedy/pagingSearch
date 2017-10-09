package model;

import lombok.Data;

import java.util.List;

/**
 * Created by Jzedy on 2017/10/9.
 */
@Data
public  class  Pager<T> {
    /**
     * 当前页面
     */
    public int currentPage;
    public static int CURRENTPAGE = 1;
    /**
     * 当前显示页面
     */
    public int showNums;
    public static int SHOWNUMS=5;

    /**
     * 总页面数量
     */
    public  int totalPages;
    /**
     * 数据总数
     */
    public  int totalNums;
    /**
     * 数据结果集
     */
    public List<T> dataList;

    public Pager(List<T> sourceList,int currentPage,int showNums,int totalNums){
        if (sourceList.isEmpty()) return;
        this.totalNums = totalNums;
        this.currentPage = currentPage;
        this.showNums = showNums;
        this.totalPages = totalNums/showNums;
        if (totalNums%showNums!=0) this.totalPages++;
        this.dataList = sourceList;
    }

}
