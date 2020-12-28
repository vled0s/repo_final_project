package com.epam.rd.izh.entity;

import lombok.Data;

import javax.persistence.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

@Entity
@Data
@Table(name = "sharing_requests")
public class SharingRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long requestId;
    private Date startSharingDate;
    private Date endSharingDate;
    private Long carId;
    private Long userId;




    public void setStartSharingDate(String startSharingDateString) throws ParseException {
        this.startSharingDate = convertDate(startSharingDateString);
    }

    public void setEndSharingDate(String endSharingDateString) throws ParseException {
        this.endSharingDate = convertDate(endSharingDateString);
    }

    private Date convertDate(String strDate) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm", Locale.getDefault());
        Date date = simpleDateFormat.parse(strDate);
        return date;
    }
}
