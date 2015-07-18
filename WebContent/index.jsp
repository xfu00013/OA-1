<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<LINK href="style/login.css" type=text/css rel=stylesheet>
<title>Web OA System Main Page</title>
</head>
<body>
<body class=Pagebody leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0">
	<center>
		<form action="login.action" method="post">
			<table height="100%" cellSpacing=0 cellPadding=0 border=0>
				<tbody>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td>
							<table cellSpacing=0 cellPadding=0 border=0>
								<tbody>
									<tr class=Uptr height=20>
										<td></td>
										<td></td>
										<td class=VersionTitle align=right></td>
									</tr>
									<tr class=Uptr height=65>
										<td width=20></td>
										<td colSpan=2>
											<img src="images/login/logo.gif" border=0>
										</td>
									</tr>
									<tr height=3>
										<td background=images/login/logo_under_line.gif colSpan=3></td>
									</tr>
									<tr class=Downtr>
										<td></td>
										<td>
											<table height=204 cellSpacing=0 cellPadding=0 border=0>
												<tbody>
													<tr height=50>
														<td colSpan=3></td>
													</tr>
													<tr height=18>
														<td width=290 background=images/login/userLogin.gif colSpan=3></td>
													</tr>
													<tr>
														<td class=LoginLine width=2></td>
														<td width=286>
															<table height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
																<tbody>
																	<tr height=10>
																		<td colSpan=6></td>
																	</tr>
																	<tr>
																		<td class=ItemTitleFont align=right width=80 height=25>User:</td>
																		<td width=100>
																			<input class=inputFrm name=username>
																		</td>
																		<td align="center" rowSpan=2>
																			<input type="image" src="images/login/userLogin_button.gif" border=0>
																		</td>
																	</tr>
																	<tr>
																		<td class=ItemTitleFont align=right height=25>
																			Password:
																		</td>
																		<td>
																			<input class=inputFrm type=password name=password>
																		</td>
																	</tr>

																	<tr>
																		<td></td>
																		<td></td>
																		<td></td>
																	</tr>
																</tbody>
															</table>
														</td>
														<td class=LoginLine width=2></td>
													</tr>
													<tr height=11>
														<td width=290 background=images/login/userLogin_down.gif colSpan=3></td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width=228>
											<img src="images/login/logo_bg.gif" border=0>
										</td>
									</tr>
									
								</tbody>
							</table>
						</td>
					</tr>
					<tr height="3%">
						<td></td>
					</tr>
				</tbody>
			</table>
		</form>
	</center>
</body>
</html>