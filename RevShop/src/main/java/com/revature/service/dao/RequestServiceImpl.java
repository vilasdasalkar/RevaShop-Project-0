package com.revature.service.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.revature.data.RequestData;
import com.revature.service.RequestService;
import com.revature.utilities.DBUtil;


public class RequestServiceImpl implements RequestService {
	@Override
	public boolean addProduct(String userId, String prodId, int demandQty) {
		boolean flag = false;

		//get the database connection
		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;

		try {
			//create the prepared statement with the query
			ps = con.prepareStatement("select * from user_demand where username=? and prodid=?");

			ps.setString(1, userId);
			ps.setString(2, prodId);

			rs = ps.executeQuery();

			if (rs.next()) {

				flag = true;
			} else {
				ps2 = con.prepareStatement("insert into  user_demand values(?,?,?)");

				ps2.setString(1, userId);

				ps2.setString(2, prodId);

				ps2.setInt(3, demandQty);

				int k = ps2.executeUpdate();

				if (k > 0)
					flag = true;
			}

		} catch (SQLException e) {
			flag = false;
			e.printStackTrace();
		}

		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(ps2);
		DBUtil.closeConnection(rs);
		//return true if the product is added into the db
		return flag;
	}

	@Override
	public boolean removeProduct(String userId, String prodId) {
		boolean flag = false;

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select * from user_demand where username=? and prodid=?");

			ps.setString(1, userId);
			ps.setString(2, prodId);

			rs = ps.executeQuery();

			// System.out.println("userId "+userId+"\nprodId: "+prodId);

			if (rs.next()) {

				// System.out.println("userId "+userId+"\nprodId: "+prodId);
				ps2 = con.prepareStatement("delete from  user_demand where username=? and prodid=?");

				ps2.setString(1, userId);

				ps2.setString(2, prodId);

				int k = ps2.executeUpdate();

				if (k > 0)
					flag = true;

			} else {
				flag = true;
			}

		} catch (SQLException e) {
			flag = false;
			e.printStackTrace();
		}

		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(ps2);
		DBUtil.closeConnection(rs);

		return flag;
	}

	@Override
	public boolean addProduct(RequestData userRequestData) {

		return addProduct(userRequestData.getUserName(), userRequestData.getProdId(), userRequestData.getDemandQty());
	}

	@Override
	public List<RequestData> haveDemanded(String prodId) {
		List<RequestData> demandList = new ArrayList<RequestData>();

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select * from user_demand where prodid=?");
			ps.setString(1, prodId);
			rs = ps.executeQuery();

			while (rs.next()) {

				RequestData demand = new RequestData(rs.getString("username"), rs.getString("prodid"),
						rs.getInt("quantity"));

				demandList.add(demand);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return demandList;
	}
}
