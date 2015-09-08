
package com.vlab.guacamole.vnc;

/*
 *  Guacamole - Pure JavaScript/HTML VNC Client
 *  Copyright (C) 2010  Michael Jumper
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Affero General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Affero General Public License for more details.
 *
 *  You should have received a copy of the GNU Affero General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import com.vlab.guacamole.net.Configuration;
import com.vlab.guacamole.GuacamoleException;
import javax.servlet.ServletContext;

public class VNCConfiguration extends Configuration {

    private String hostname;
    private int port;
    private String password;
    private int bpp;

    public VNCConfiguration(ServletContext context) throws GuacamoleException {

        super(context);
        
        //hostname       = readParameter("host", "127.0.0.1");
        //hostname       = readParameter("host", "10.14.41.10");
        String remote_sys_ip = (String) context.getAttribute("remote_sys_ip");
        hostname       = readParameter("host", remote_sys_ip);
        //hostname       = readParameter("host", "localhost");
        port           = readIntParameter("port", 5900);
        password  = context.getInitParameter("password");
        bpp = readIntParameter("bpp", 24, 8, 16, 24);
        
        System.out.println("remote_sys_ip "+remote_sys_ip);
        
    }

    public int getBPP() {
        return bpp;
    }

    public String getPassword() {
        return password;
    }

    public String getHostname() {
        return hostname;
    }

    public int getPort() {
        return port;
    }

}
